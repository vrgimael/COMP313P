execute_process(COMMAND "/home/ros_user/COMP313P/build/comp313p/comp313p_planner_controller/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/ros_user/COMP313P/build/comp313p/comp313p_planner_controller/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
