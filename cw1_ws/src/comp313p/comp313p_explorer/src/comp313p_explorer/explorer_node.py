import rospy
from explorer_node_base import ExplorerNodeBase
from geometry_msgs.msg  import Pose2D
from math import pow, atan2, sqrt, pi
from std_msgs.msg import Bool

class ExplorerNode(ExplorerNodeBase):

    def __init__(self):
        ExplorerNodeBase.__init__(self)
        self.blackList = []
        self.mode = 'nearest' # 'dumb' or 'nearest'
        self.poseSubscriber = rospy.Subscriber('/robot0/pose', Pose2D, self.poseCallback)
        self.skipGoalPublisher = rospy.Publisher('/robot0/skip_goal', Bool, queue_size=10)
        self.pose = Pose2D()
        self.current_goal = Pose2D()
        self.goal_seen = 0


    def updateFrontiers(self):
        pass


    def poseCallback(self, pose):
        goal = self.current_goal
        self.pose = pose

        if self.isFrontierCell(goal[0], goal[1]) is False:
            self.goal_seen += 1
            if self.goal_seen > 0:
                print '> skipping goal'
                print goal
                self.destinationReached(goal, False)
                self.skipGoalPublisher.publish(True)
                self.goal_seen = 0


    def chooseNewDestination(self):
        # print 'blackList:'
        # for coords in self.blackList:
        #     print str(coords)
        if self.mode == 'dumb':
            print '[INFO] Using dumb explorer'
            return self.dumbExplorer()
        elif self.mode == 'nearest':
            print '[INFO] Using nearest explorer'
            return self.nearestExplorer()
        else:
            print '[ERROR] No mode chosen in ExplorerNode!'


    def euclidean_distance(self, goal_pose):
        correction = 5
        self_pose_x = self.pose.x * correction
        self_pose_y = self.pose.y * correction
        return sqrt(pow((goal_pose[0] - self_pose_x), 2) +
                    pow((goal_pose[1] - self_pose_y), 2))


    def nearestExplorer(self):
        candidates = []
        for x in range(0, self.occupancyGrid.getWidthInCells()):
            for y in range(0, self.occupancyGrid.getHeightInCells()):
                candidate = (x, y)
                if self.isFrontierCell(x, y) is True:
                    candidateGood = True
                    for k in range(0, len(self.blackList)):
                        if self.blackList[k] == candidate:
                            candidateGood = False
                            break
                    if candidateGood is True:
                        candidates.append(candidate)

        # print 'candidates [not-sorted]'
        # print candidates

        # sorts candidates by distance to robot
        candidates = sorted(candidates, key=lambda c: self.euclidean_distance(c))

        # print 'candidates [sorted]'
        # print candidates

        if len(candidates) > 0:
            if self.current_goal == candidates[0]:
                # adds goal to blacklist if it's repeated to avoid getting stuck
                self.destinationReached(candidates[0], False)
                destination = candidates[1]
            else:
                destination = candidates[0]
            self.current_goal = destination
            # returns the frontier cell to robot
            return True, destination
        else:
            return False, None

    def dumbExplorer(self):
        for x in range(0, self.occupancyGrid.getWidthInCells()):
            for y in range(0, self.occupancyGrid.getHeightInCells()):
                candidate = (x, y)
                if self.isFrontierCell(x, y) is True:
                    candidateGood = True
                    for k in range(0, len(self.blackList)):
                        if self.blackList[k] == candidate:
                            candidateGood = False
                            break

                    if candidateGood is True:
                        return True, candidate
        return False, None

    def destinationReached(self, goal, goalReached):
        if goalReached is False:
            print 'Adding ' + str(goal) + ' to the naughty step'
            self.blackList.append(goal)
