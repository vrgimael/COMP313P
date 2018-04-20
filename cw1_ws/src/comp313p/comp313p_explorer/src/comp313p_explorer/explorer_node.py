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


    def updateFrontiers(self):
        pass


    def poseCallback(self, pose):
        goal = self.current_goal

        # print '> > Current goal'
        # print goal

        self.pose = pose
        if self.isFrontierCell(goal[0], goal[1]) is False:
            self.skipGoalPublisher.publish(True)



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
        # print 'euclidean_distance'
        correction = 5
        self_pose_x = self.pose.x * correction
        self_pose_y = self.pose.y * correction
        # print 'goal_pose'
        # print goal_pose
        # print 'self_x: ' + str(self_pose_x) + ' | self_y: ' + str(self_pose_y)
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

        candidates = sorted(candidates, key=lambda c: self.euclidean_distance(c))

        # print 'candidates [sorted]'
        # print candidates

        if len(candidates) > 0:
            self.current_goal = candidates[0]
            return True, candidates[0]
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
