# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ros_user/COMP313P/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ros_user/COMP313P/build

# Utility rule file for clean_test_results_stdr_server.

# Include the progress variables for this target.
include comp313p/stdr_simulator/stdr_server/test/CMakeFiles/clean_test_results_stdr_server.dir/progress.make

comp313p/stdr_simulator/stdr_server/test/CMakeFiles/clean_test_results_stdr_server:
	cd /home/ros_user/COMP313P/build/comp313p/stdr_simulator/stdr_server/test && /usr/bin/python /opt/ros/kinetic/share/catkin/cmake/test/remove_test_results.py /home/ros_user/COMP313P/build/test_results/stdr_server

clean_test_results_stdr_server: comp313p/stdr_simulator/stdr_server/test/CMakeFiles/clean_test_results_stdr_server
clean_test_results_stdr_server: comp313p/stdr_simulator/stdr_server/test/CMakeFiles/clean_test_results_stdr_server.dir/build.make

.PHONY : clean_test_results_stdr_server

# Rule to build all files generated by this target.
comp313p/stdr_simulator/stdr_server/test/CMakeFiles/clean_test_results_stdr_server.dir/build: clean_test_results_stdr_server

.PHONY : comp313p/stdr_simulator/stdr_server/test/CMakeFiles/clean_test_results_stdr_server.dir/build

comp313p/stdr_simulator/stdr_server/test/CMakeFiles/clean_test_results_stdr_server.dir/clean:
	cd /home/ros_user/COMP313P/build/comp313p/stdr_simulator/stdr_server/test && $(CMAKE_COMMAND) -P CMakeFiles/clean_test_results_stdr_server.dir/cmake_clean.cmake
.PHONY : comp313p/stdr_simulator/stdr_server/test/CMakeFiles/clean_test_results_stdr_server.dir/clean

comp313p/stdr_simulator/stdr_server/test/CMakeFiles/clean_test_results_stdr_server.dir/depend:
	cd /home/ros_user/COMP313P/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ros_user/COMP313P/src /home/ros_user/COMP313P/src/comp313p/stdr_simulator/stdr_server/test /home/ros_user/COMP313P/build /home/ros_user/COMP313P/build/comp313p/stdr_simulator/stdr_server/test /home/ros_user/COMP313P/build/comp313p/stdr_simulator/stdr_server/test/CMakeFiles/clean_test_results_stdr_server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : comp313p/stdr_simulator/stdr_server/test/CMakeFiles/clean_test_results_stdr_server.dir/depend

