# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /tmp/speakerlabel

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /tmp/speakerlabel/build

# Include any dependencies generated for this target.
include CMakeFiles/zoomsdk.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/zoomsdk.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/zoomsdk.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/zoomsdk.dir/flags.make

CMakeFiles/zoomsdk.dir/src/main.cpp.o: CMakeFiles/zoomsdk.dir/flags.make
CMakeFiles/zoomsdk.dir/src/main.cpp.o: ../src/main.cpp
CMakeFiles/zoomsdk.dir/src/main.cpp.o: CMakeFiles/zoomsdk.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/speakerlabel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/zoomsdk.dir/src/main.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/zoomsdk.dir/src/main.cpp.o -MF CMakeFiles/zoomsdk.dir/src/main.cpp.o.d -o CMakeFiles/zoomsdk.dir/src/main.cpp.o -c /tmp/speakerlabel/src/main.cpp

CMakeFiles/zoomsdk.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/zoomsdk.dir/src/main.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/speakerlabel/src/main.cpp > CMakeFiles/zoomsdk.dir/src/main.cpp.i

CMakeFiles/zoomsdk.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/zoomsdk.dir/src/main.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/speakerlabel/src/main.cpp -o CMakeFiles/zoomsdk.dir/src/main.cpp.s

CMakeFiles/zoomsdk.dir/src/Zoom.cpp.o: CMakeFiles/zoomsdk.dir/flags.make
CMakeFiles/zoomsdk.dir/src/Zoom.cpp.o: ../src/Zoom.cpp
CMakeFiles/zoomsdk.dir/src/Zoom.cpp.o: CMakeFiles/zoomsdk.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/speakerlabel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/zoomsdk.dir/src/Zoom.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/zoomsdk.dir/src/Zoom.cpp.o -MF CMakeFiles/zoomsdk.dir/src/Zoom.cpp.o.d -o CMakeFiles/zoomsdk.dir/src/Zoom.cpp.o -c /tmp/speakerlabel/src/Zoom.cpp

CMakeFiles/zoomsdk.dir/src/Zoom.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/zoomsdk.dir/src/Zoom.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/speakerlabel/src/Zoom.cpp > CMakeFiles/zoomsdk.dir/src/Zoom.cpp.i

CMakeFiles/zoomsdk.dir/src/Zoom.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/zoomsdk.dir/src/Zoom.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/speakerlabel/src/Zoom.cpp -o CMakeFiles/zoomsdk.dir/src/Zoom.cpp.s

CMakeFiles/zoomsdk.dir/src/Config.cpp.o: CMakeFiles/zoomsdk.dir/flags.make
CMakeFiles/zoomsdk.dir/src/Config.cpp.o: ../src/Config.cpp
CMakeFiles/zoomsdk.dir/src/Config.cpp.o: CMakeFiles/zoomsdk.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/speakerlabel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/zoomsdk.dir/src/Config.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/zoomsdk.dir/src/Config.cpp.o -MF CMakeFiles/zoomsdk.dir/src/Config.cpp.o.d -o CMakeFiles/zoomsdk.dir/src/Config.cpp.o -c /tmp/speakerlabel/src/Config.cpp

CMakeFiles/zoomsdk.dir/src/Config.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/zoomsdk.dir/src/Config.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/speakerlabel/src/Config.cpp > CMakeFiles/zoomsdk.dir/src/Config.cpp.i

CMakeFiles/zoomsdk.dir/src/Config.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/zoomsdk.dir/src/Config.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/speakerlabel/src/Config.cpp -o CMakeFiles/zoomsdk.dir/src/Config.cpp.s

CMakeFiles/zoomsdk.dir/src/events/AuthServiceEvent.cpp.o: CMakeFiles/zoomsdk.dir/flags.make
CMakeFiles/zoomsdk.dir/src/events/AuthServiceEvent.cpp.o: ../src/events/AuthServiceEvent.cpp
CMakeFiles/zoomsdk.dir/src/events/AuthServiceEvent.cpp.o: CMakeFiles/zoomsdk.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/speakerlabel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/zoomsdk.dir/src/events/AuthServiceEvent.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/zoomsdk.dir/src/events/AuthServiceEvent.cpp.o -MF CMakeFiles/zoomsdk.dir/src/events/AuthServiceEvent.cpp.o.d -o CMakeFiles/zoomsdk.dir/src/events/AuthServiceEvent.cpp.o -c /tmp/speakerlabel/src/events/AuthServiceEvent.cpp

CMakeFiles/zoomsdk.dir/src/events/AuthServiceEvent.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/zoomsdk.dir/src/events/AuthServiceEvent.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/speakerlabel/src/events/AuthServiceEvent.cpp > CMakeFiles/zoomsdk.dir/src/events/AuthServiceEvent.cpp.i

CMakeFiles/zoomsdk.dir/src/events/AuthServiceEvent.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/zoomsdk.dir/src/events/AuthServiceEvent.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/speakerlabel/src/events/AuthServiceEvent.cpp -o CMakeFiles/zoomsdk.dir/src/events/AuthServiceEvent.cpp.s

CMakeFiles/zoomsdk.dir/src/events/MeetingServiceEvent.cpp.o: CMakeFiles/zoomsdk.dir/flags.make
CMakeFiles/zoomsdk.dir/src/events/MeetingServiceEvent.cpp.o: ../src/events/MeetingServiceEvent.cpp
CMakeFiles/zoomsdk.dir/src/events/MeetingServiceEvent.cpp.o: CMakeFiles/zoomsdk.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/speakerlabel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/zoomsdk.dir/src/events/MeetingServiceEvent.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/zoomsdk.dir/src/events/MeetingServiceEvent.cpp.o -MF CMakeFiles/zoomsdk.dir/src/events/MeetingServiceEvent.cpp.o.d -o CMakeFiles/zoomsdk.dir/src/events/MeetingServiceEvent.cpp.o -c /tmp/speakerlabel/src/events/MeetingServiceEvent.cpp

CMakeFiles/zoomsdk.dir/src/events/MeetingServiceEvent.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/zoomsdk.dir/src/events/MeetingServiceEvent.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/speakerlabel/src/events/MeetingServiceEvent.cpp > CMakeFiles/zoomsdk.dir/src/events/MeetingServiceEvent.cpp.i

CMakeFiles/zoomsdk.dir/src/events/MeetingServiceEvent.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/zoomsdk.dir/src/events/MeetingServiceEvent.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/speakerlabel/src/events/MeetingServiceEvent.cpp -o CMakeFiles/zoomsdk.dir/src/events/MeetingServiceEvent.cpp.s

CMakeFiles/zoomsdk.dir/src/events/MeetingReminderEvent.cpp.o: CMakeFiles/zoomsdk.dir/flags.make
CMakeFiles/zoomsdk.dir/src/events/MeetingReminderEvent.cpp.o: ../src/events/MeetingReminderEvent.cpp
CMakeFiles/zoomsdk.dir/src/events/MeetingReminderEvent.cpp.o: CMakeFiles/zoomsdk.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/speakerlabel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/zoomsdk.dir/src/events/MeetingReminderEvent.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/zoomsdk.dir/src/events/MeetingReminderEvent.cpp.o -MF CMakeFiles/zoomsdk.dir/src/events/MeetingReminderEvent.cpp.o.d -o CMakeFiles/zoomsdk.dir/src/events/MeetingReminderEvent.cpp.o -c /tmp/speakerlabel/src/events/MeetingReminderEvent.cpp

CMakeFiles/zoomsdk.dir/src/events/MeetingReminderEvent.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/zoomsdk.dir/src/events/MeetingReminderEvent.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/speakerlabel/src/events/MeetingReminderEvent.cpp > CMakeFiles/zoomsdk.dir/src/events/MeetingReminderEvent.cpp.i

CMakeFiles/zoomsdk.dir/src/events/MeetingReminderEvent.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/zoomsdk.dir/src/events/MeetingReminderEvent.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/speakerlabel/src/events/MeetingReminderEvent.cpp -o CMakeFiles/zoomsdk.dir/src/events/MeetingReminderEvent.cpp.s

CMakeFiles/zoomsdk.dir/src/events/MeetingRecordingCtrlEvent.cpp.o: CMakeFiles/zoomsdk.dir/flags.make
CMakeFiles/zoomsdk.dir/src/events/MeetingRecordingCtrlEvent.cpp.o: ../src/events/MeetingRecordingCtrlEvent.cpp
CMakeFiles/zoomsdk.dir/src/events/MeetingRecordingCtrlEvent.cpp.o: CMakeFiles/zoomsdk.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/speakerlabel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/zoomsdk.dir/src/events/MeetingRecordingCtrlEvent.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/zoomsdk.dir/src/events/MeetingRecordingCtrlEvent.cpp.o -MF CMakeFiles/zoomsdk.dir/src/events/MeetingRecordingCtrlEvent.cpp.o.d -o CMakeFiles/zoomsdk.dir/src/events/MeetingRecordingCtrlEvent.cpp.o -c /tmp/speakerlabel/src/events/MeetingRecordingCtrlEvent.cpp

CMakeFiles/zoomsdk.dir/src/events/MeetingRecordingCtrlEvent.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/zoomsdk.dir/src/events/MeetingRecordingCtrlEvent.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/speakerlabel/src/events/MeetingRecordingCtrlEvent.cpp > CMakeFiles/zoomsdk.dir/src/events/MeetingRecordingCtrlEvent.cpp.i

CMakeFiles/zoomsdk.dir/src/events/MeetingRecordingCtrlEvent.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/zoomsdk.dir/src/events/MeetingRecordingCtrlEvent.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/speakerlabel/src/events/MeetingRecordingCtrlEvent.cpp -o CMakeFiles/zoomsdk.dir/src/events/MeetingRecordingCtrlEvent.cpp.s

CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKAudioRawDataDelegate.cpp.o: CMakeFiles/zoomsdk.dir/flags.make
CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKAudioRawDataDelegate.cpp.o: ../src/raw_record/ZoomSDKAudioRawDataDelegate.cpp
CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKAudioRawDataDelegate.cpp.o: CMakeFiles/zoomsdk.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/speakerlabel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKAudioRawDataDelegate.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKAudioRawDataDelegate.cpp.o -MF CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKAudioRawDataDelegate.cpp.o.d -o CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKAudioRawDataDelegate.cpp.o -c /tmp/speakerlabel/src/raw_record/ZoomSDKAudioRawDataDelegate.cpp

CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKAudioRawDataDelegate.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKAudioRawDataDelegate.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/speakerlabel/src/raw_record/ZoomSDKAudioRawDataDelegate.cpp > CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKAudioRawDataDelegate.cpp.i

CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKAudioRawDataDelegate.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKAudioRawDataDelegate.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/speakerlabel/src/raw_record/ZoomSDKAudioRawDataDelegate.cpp -o CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKAudioRawDataDelegate.cpp.s

CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKRendererDelegate.cpp.o: CMakeFiles/zoomsdk.dir/flags.make
CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKRendererDelegate.cpp.o: ../src/raw_record/ZoomSDKRendererDelegate.cpp
CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKRendererDelegate.cpp.o: CMakeFiles/zoomsdk.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/speakerlabel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKRendererDelegate.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKRendererDelegate.cpp.o -MF CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKRendererDelegate.cpp.o.d -o CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKRendererDelegate.cpp.o -c /tmp/speakerlabel/src/raw_record/ZoomSDKRendererDelegate.cpp

CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKRendererDelegate.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKRendererDelegate.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /tmp/speakerlabel/src/raw_record/ZoomSDKRendererDelegate.cpp > CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKRendererDelegate.cpp.i

CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKRendererDelegate.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKRendererDelegate.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /tmp/speakerlabel/src/raw_record/ZoomSDKRendererDelegate.cpp -o CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKRendererDelegate.cpp.s

# Object files for target zoomsdk
zoomsdk_OBJECTS = \
"CMakeFiles/zoomsdk.dir/src/main.cpp.o" \
"CMakeFiles/zoomsdk.dir/src/Zoom.cpp.o" \
"CMakeFiles/zoomsdk.dir/src/Config.cpp.o" \
"CMakeFiles/zoomsdk.dir/src/events/AuthServiceEvent.cpp.o" \
"CMakeFiles/zoomsdk.dir/src/events/MeetingServiceEvent.cpp.o" \
"CMakeFiles/zoomsdk.dir/src/events/MeetingReminderEvent.cpp.o" \
"CMakeFiles/zoomsdk.dir/src/events/MeetingRecordingCtrlEvent.cpp.o" \
"CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKAudioRawDataDelegate.cpp.o" \
"CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKRendererDelegate.cpp.o"

# External object files for target zoomsdk
zoomsdk_EXTERNAL_OBJECTS =

zoomsdk: CMakeFiles/zoomsdk.dir/src/main.cpp.o
zoomsdk: CMakeFiles/zoomsdk.dir/src/Zoom.cpp.o
zoomsdk: CMakeFiles/zoomsdk.dir/src/Config.cpp.o
zoomsdk: CMakeFiles/zoomsdk.dir/src/events/AuthServiceEvent.cpp.o
zoomsdk: CMakeFiles/zoomsdk.dir/src/events/MeetingServiceEvent.cpp.o
zoomsdk: CMakeFiles/zoomsdk.dir/src/events/MeetingReminderEvent.cpp.o
zoomsdk: CMakeFiles/zoomsdk.dir/src/events/MeetingRecordingCtrlEvent.cpp.o
zoomsdk: CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKAudioRawDataDelegate.cpp.o
zoomsdk: CMakeFiles/zoomsdk.dir/src/raw_record/ZoomSDKRendererDelegate.cpp.o
zoomsdk: CMakeFiles/zoomsdk.dir/build.make
zoomsdk: vcpkg_installed/x64-linux/debug/lib/libada.a
zoomsdk: vcpkg_installed/x64-linux/debug/lib/libCLI11.a
zoomsdk: /usr/lib/x86_64-linux-gnu/libgio-2.0.so
zoomsdk: /usr/lib/x86_64-linux-gnu/libgobject-2.0.so
zoomsdk: /usr/lib/x86_64-linux-gnu/libglib-2.0.so
zoomsdk: CMakeFiles/zoomsdk.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/tmp/speakerlabel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Linking CXX executable zoomsdk"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/zoomsdk.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/zoomsdk.dir/build: zoomsdk
.PHONY : CMakeFiles/zoomsdk.dir/build

CMakeFiles/zoomsdk.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/zoomsdk.dir/cmake_clean.cmake
.PHONY : CMakeFiles/zoomsdk.dir/clean

CMakeFiles/zoomsdk.dir/depend:
	cd /tmp/speakerlabel/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/speakerlabel /tmp/speakerlabel /tmp/speakerlabel/build /tmp/speakerlabel/build /tmp/speakerlabel/build/CMakeFiles/zoomsdk.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/zoomsdk.dir/depend
