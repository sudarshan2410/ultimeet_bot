from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import subprocess
import toml
import os
import logging

app = FastAPI()

CONFIG_FILE_PATH = "./config.toml"  # Path inside Docker container
ENTRY_SCRIPT_PATH = "./bin/entry.sh"  # Path inside Docker container

logging.basicConfig(level=logging.INFO)

class JoinURLRequest(BaseModel):
    join_url: str
    meeting_id: str

def update_config(join_url: str, meeting_id: str):
    logging.info(f"Updating config with join_url: {join_url} and meeting_id: {meeting_id}")

    # Load the existing configuration
    try:
        config = toml.load(CONFIG_FILE_PATH)
        logging.info(f"Loaded config: {config}")
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Failed to load config: {e}")

    # Update the join-url and meeting-id
    config['join-url'] = join_url
    config['file'] = meeting_id

    logging.info(f"Updated config: {config}")
    
    # Write the updated configuration back to the file
    try:
        with open(CONFIG_FILE_PATH, 'w') as f:
            toml.dump(config, f)
        logging.info(f"Successfully wrote updated config to {CONFIG_FILE_PATH}")
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Failed to write config: {e}")

def run_entry_script():
    # Check if the script exists
    if not os.path.exists(ENTRY_SCRIPT_PATH):
        raise HTTPException(status_code=500, detail="entry.sh script not found")

    # Run the script
    result = subprocess.run([ENTRY_SCRIPT_PATH], capture_output=True, text=True, shell=True)
    if result.returncode != 0:
        raise HTTPException(status_code=500, detail=f"Script failed with error: {result.stderr}")
    
    return result.stdout

@app.post("/update-config/")
async def update_config_endpoint(request: JoinURLRequest):
    logging.info(f"Received request: {request}")
    update_config(request.join_url, request.meeting_id)
    return {"message": "Config updated successfully"}

@app.post("/start-meeting/")
async def start_meeting():
    # Check if config has been updated correctly
    try:
        with open(CONFIG_FILE_PATH, 'r') as f:
            config = toml.load(f)
            logging.info(f"Config read before starting meeting: {config}")
            if not config.get('join-url'):
                raise HTTPException(status_code=400, detail="join-url is blank in config.toml")
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Config validation failed: {e}")
    
    # Run the entry script
    output = run_entry_script()
    return {"message": "Zoom meeting started", "script_output": output}

@app.get("/")
async def root():
    return {"message": "FastAPI server is running"}
