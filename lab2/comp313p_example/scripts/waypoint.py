#!/usr/bin/env python

import rospy
from geometry_msgs.msg  import Twist
from nav_msgs.msg import Odometry
from math import pow,atan2,sqrt,pi
from PyKDL import Rotation
import fileinput










class stdr_controller():

    def __init__(self):
        #Creating our node,publisher and subscriber
        rospy.init_node('stdr_controller', anonymous=True)
        self.velocity_publisher = rospy.Publisher('/robot0/cmd_vel', Twist, queue_size=10)
        self.start_pos = rospy.Publisher('/robot0/cmd_vel', Twist, queue_size=10)
        self.current_pose_subscriber = rospy.Subscriber('/robot0/odom', Odometry, self.current_callback)
        self.current_pose = Odometry()
        self.distance_tolerance = 0.1
        self.angle_tolerance = 5
 
    def current_callback(self, data):
        self.current_pose = data

    def run(self):

        # Sleep for 1s before starting. This gives time for all the parts of stdr to start up
        rospy.sleep(1.0)

        sta_pos = Twist()

        pose_start = self.current_pose.pose.pose
        start_position = pose_start.start_position
        start_orientation = pose_start.start_orientation
        start_theta = 2 * atan2(start_orientation.z, start_orientation.w) * 180 / pi

        while not rospy.is_shutdown():
 
            vel_msg = Twist()
	    
            pose = self.current_pose.pose.pose

            # Get the position vector. ROS uses nested types for generality, but it gets to be a bit
            # cumbersome

            position = pose.position
 
            # The pose returns the orientation as a quaternion, which is a 4D representation of 3D
            # rotations. We just want the heading angle, so some conversion is required
            # 
            orientation = pose.orientation

            theta = 2 * atan2(orientation.z, orientation.w) * 180 / pi


            position.x = 0
            position.y = 0
            theta = 0

            # Show the output
            rospy.loginfo('Current position, x: {}, y:{}, theta:{}'.format(position.x,
                position.y, theta))


            if fileinput.input() is not None:
			for line in fileinput.input():
				x_line, y_line, theta_line = line.split()
				position.x = x_line
				position.y = y_line
				theta = theta_line

				self.velocity_publisher.publish(vel_msg)

			# else:
			# 	x = raw_input('Enter x: ')
			# 	y = raw_input('Enter y: ')
			# 	theta = raw_input('Enter theta: ')
			# 	print x, y, theta
            
            
            # try:
            #     lin_velocity = float(raw_input('Enter desired linear velocity: '))
            #     rot_velocity = float(raw_input('Enter desired rotational velocity: '))
            #     duration = float(raw_input('Enter desired duration: '))
            #     vel_msg.linear.x = lin_velocity
            #     vel_msg.angular.z = rot_velocity * pi / 180.0
            #     self.velocity_publisher.publish(vel_msg)
            #     rospy.sleep(duration)
            # except ValueError:
            #     rospy.loginfo('Illegal value entered; try again')

            # vel_msg.linear.x = 0.0
            # vel_msg.angular.z = 0.0

   
if __name__ == '__main__':
    try:
        #Testing our function
        x = stdr_controller()
        x.run()

    except rospy.ROSInterruptException: pass

