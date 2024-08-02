import logging
from fastapi import FastAPI, HTTPException, BackgroundTasks
from pydantic import BaseModel
import subprocess
import toml
import os

app = FastAPI()

CONFIG_FILE_PATH = "./config.toml"  # Path inside Docker container
ENTRY_SCRIPT_PATH = "./bin/entry.sh"  # Path inside Docker container

logging.basicConfig(level=logging.INFO)

class JoinURLRequest(BaseModel):
    join_url: str
    meeting_id: str
    audio_file: str

# New model for meeting status update
class MeetingStatusRequest(BaseModel):
    meeting_id: str
    status: str
    audio_file: str = None  # Optional, in case the audio file is included in the update


def update_config(join_url: str, meeting_id: str, audio_file: str):
    logging.info(f"Updating config with join_url: {join_url}, meeting_id: {meeting_id}, and audio_file: {audio_file}")

    # Load the existing configuration
    try:
        config = toml.load(CONFIG_FILE_PATH)
        logging.info(f"Loaded config: {config}")
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Failed to load config: {e}")

    # Update the configuration
    config['join-url'] = join_url
    config['RawAudio']['file'] = audio_file  # Set the audio file name

    logging.info(f"Updated config: {config}")
    
    # Write the updated configuration back to the file
    try:
        with open(CONFIG_FILE_PATH, 'w') as f:
            toml.dump(config, f)
        logging.info(f"Successfully wrote updated config to {CONFIG_FILE_PATH}")
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Failed to write config: {e}")

def run_entry_script(join_url: str, meeting_id: str, audio_file: str):
    # Check if the script exists
    if not os.path.exists(ENTRY_SCRIPT_PATH):
        logging.error("entry.sh script not found")
        return
    
    # Run the script with the specified parameters
    command = [ENTRY_SCRIPT_PATH, "-u", join_url, "-m", meeting_id, "-f", audio_file]
    process = subprocess.Popen(
        command,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )

    # Optionally, log the output and errors
    stdout, stderr = process.communicate()  # This waits for the process to complete
    logging.info(f"Script stdout: {stdout}")
    if stderr:
        logging.error(f"Script stderr: {stderr}")

    if process.returncode != 0:
        logging.error(f"Script failed with exit code {process.returncode}")
    else:
        logging.info(f"Script completed successfully with exit code {process.returncode}")

@app.post("/start-recording/")
async def start_recording(request: JoinURLRequest, background_tasks: BackgroundTasks):
    logging.info(f"Received request: {request}")
    
    try:
        update_config(request.join_url, request.meeting_id, request.audio_file)
    except HTTPException as e:
        raise e
    
    # Add the script execution to background tasks
    background_tasks.add_task(run_entry_script, request.join_url, request.meeting_id, request.audio_file)
    
    return {"message": "Recording started", "status": "done"}


@app.post("/meeting-status/")
async def meeting_status(request: MeetingStatusRequest):
    logging.info(f"Received meeting status update: {request}")

    # Here you can process the meeting status
    # For example, log the meeting status
    if request.audio_file:
        logging.info(f"Meeting ID: {request.meeting_id}, Status: {request.status}, Audio File: {request.audio_file}")
    else:
        logging.info(f"Meeting ID: {request.meeting_id}, Status: {request.status}")

    # Add any additional logic here, such as updating a database

    return {"message": "Meeting status updated", "status": "processed"}

@app.get("/")
async def root():
    return {"message": "FastAPI server is running"}
