#!/usr/bin/env python

import rospy
from geometry_msgs.msg  import Twist
from nav_msgs.msg import Odometry
from math import pow,atan2,sqrt,pi

class Pose:
   def __init__(self, x = 0, y = 0):
      self.x = x
      self.y = y

class stdr_controller():

    def __init__(self):
        #Creating our node,publisher and subscriber
        rospy.init_node('stdr_controller', anonymous=True)
        self.velocity_publisher = rospy.Publisher('/robot0/cmd_vel', Twist, queue_size=10)
        self.current_pose_subscriber = rospy.Subscriber('/robot0/odom', Odometry, self.current_callback)
        self.current_pose = Odometry()
        self.distance_tolerance = 0.1
        self.rate = rospy.Rate(10)


    def current_callback(self, data):
        self.current_pose = data


    def euclidean_distance(self, goal_pose):
        pose = self.current_pose.pose.pose
        position = pose.position
        return sqrt(pow((goal_pose.x - position.x), 2) +
                    pow((goal_pose.y - position.y), 2))

    def linear_vel(self, goal_pose, constant=0.2, maximum=1):
        speed = constant * self.euclidean_distance(goal_pose)
        # rospy.loginfo('Speed: {}'.format(speed)) 
        return min(speed, maximum)

    def steering_angle(self, goal_pose):
        pose = self.current_pose.pose.pose
        position = pose.position
        return atan2(goal_pose.y - position.y, goal_pose.x - position.x)

    def angular_vel(self, goal_pose, constant=1):
        pose = self.current_pose.pose.pose
        orientation = pose.orientation
        theta = 2 * atan2(orientation.z, orientation.w)
        return constant * (self.steering_angle(goal_pose) - theta)


    def run(self):
        rospy.wait_for_service('/robot0/replace')
        rospy.sleep(1.0)

        while not rospy.is_shutdown():

            goal_pose = Pose()
            goal_pose.x = input("Set your x goal: ")
            goal_pose.y = input("Set your y goal: ")

            vel_msg = Twist()
            while self.euclidean_distance(goal_pose) >= self.distance_tolerance:
                pose = self.current_pose.pose.pose
                orientation = pose.orientation
                theta = 2 * atan2(orientation.z, orientation.w) * 180 / pi
                position = pose.position
                distance = self.euclidean_distance(goal_pose)
                rospy.loginfo('Current position, x: {}, y:{}, theta:{}, distance:{}'.format(position.x, position.y, theta, distance))
                vel_msg.linear.x = self.linear_vel(goal_pose)
                vel_msg.angular.z = self.angular_vel(goal_pose)
                self.velocity_publisher.publish(vel_msg)
                self.rate.sleep()

            vel_msg.linear.x = 0.0
            vel_msg.angular.z = 0.0
            self.velocity_publisher.publish(vel_msg)


if __name__ == '__main__':
    try:
        #Testing our function
        x = stdr_controller()
        x.run()

    except rospy.ROSInterruptException: pass
