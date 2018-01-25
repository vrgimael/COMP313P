#!/usr/bin/env python

import rospy
from geometry_msgs.msg  import Twist
from nav_msgs.msg import Odometry
from math import pow,atan2,sqrt,pi
from PyKDL import Rotation



class stdr_controller():

    def __init__(self):
        #Creating our node,publisher and subscriber
        rospy.init_node('stdr_controller', anonymous=True)
        # self.velocity_publisher = rospy.Publisher('/robot0/cmd_vel', Twist, queue_size=10)
        # self.rob_status = rospy.Publisher('/robot0/robot_status', Twist, queue_size=10)
        self.status_publisher = rospy.Publisher('/robot0/robot_status', Twist, queue_size=10)
        self.velocity_publisher = rospy.Publisher('/robot0/cmd_vel', Twist, queue_size=10)
        self.current_pose_subscriber = rospy.Subscriber('/robot0/odom', Odometry, self.current_callback)
        self.current_pose = Odometry()
        self.distance_tolerance = 0.1
        self.angle_tolerance = 5
        self.rate = rospy.Rate(10)

 
    def current_callback(self, data):
        self.current_pose = data


    def run(self):        
        vel_msg = Twist()
        stat_msg = Twist()
        # path = '/Users/fsaxena/Documents/UCL/3rd Year/COMP313P/src/comp313p_lab2/comp313p_example/scripts/waypoints.txt'
        path = '/home/catkin_ws/src/comp313p/comp313p_example/scripts/waypoints.txt'
        f = open(path)
        eachLine = []

        for line in f:
            eachLine.append(line)

        f.close()

        def get_goal(line_array, index):
            x_goal, y_goal, theta_goal = line_array[index].split()
            return x_goal, y_goal, theta_goal

        

        # Sleep for 1s before starting. This gives time for all the parts of stdr to start up
        rospy.sleep(1.0)

        self.pose = self.current_pose.pose.pose


        x_pos = self.pose.position.x
        y_pos = self.pose.position.y

        orientation = self.pose.orientation
        theta = 2 * atan2(orientation.z, orientation.w) * 180 / pi


        rospy.loginfo('STARTED. Current x: ' + str(x_pos) + ' Current y: ' + str(y_pos) +  ' Current theta: ' + str(theta))

        x_0, y_0, th_0 = get_goal(eachLine,0)

        while sqrt(pow((float(x_0) - x_pos), 2) + pow((float(y_0) - y_pos), 2)) >= 0.1:
            vel_msg.linear.x = 1.5 * sqrt(pow((float(x_0) - x_pos), 2) + pow((float(y_0) - y_pos), 2))
            vel_msg.linear.y = 0
            vel_msg.linear.z = 0

            self.velocity_publisher.publish(vel_msg)
            self.rate.sleep()

        vel_msg.linear.x = 0
        x_pos = self.pose.position.x
        y_pos = self.pose.position.y
        rospy.loginfo('Waypoint 1. Current x: ' + str(x_pos) + ' Current y: ' + str(y_pos) +  ' Current theta: ' + str(theta))
        self.velocity_publisher.publish(vel_msg)

        """
        while not rospy.is_shutdown():
 
            rob_stat = Twist()
	    
            # pose_start = self.current_pose.pose.pose
            # start_position = pose_start.start_position
            # start_orientation = pose_start.start_orientation
            # start_theta = 2 * atan2(start_orientation.z, start_orientation.w) * 180 / pi



            for i in range(len(eachLine)):
                line = eachLine[i]
                x_goal, y_goal, theta_goal = line.split()


            # Show the output
                rospy.loginfo('Current position, x: {}, y:{}, theta:{}'.format(x_goal,
                    y_goal, theta_goal))

            rospy.sleep(5)
			# self.velocity_publisher.publish(vel_msg)
            
            
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

            """
if __name__ == '__main__':
    try:
        #Testing our function
        x = stdr_controller()
        x.run()

    except rospy.ROSInterruptException: pass

