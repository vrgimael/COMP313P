# -*- coding: utf-8 -*-

# The planned path the robot will take. This consists of a set of waypoints.
from collections import deque

class PlannedPath(object):

    # Construct a new planner object and set defaults.
    def __init__(self):

        # Does the path actually reach the goal or not?
        self.goalReached = False
        
        # The list of waypoints, from start to finish, which make up the path.
        # The type of data stored here depends on the 
        self.waypoints = deque()

        # Performance information - number of waypoints, and the
        # travel cost of the path.
        self.numberOfWaypoints = 0
        self.travelCost = 0
        self.angleTurned = 0

    def getNumberOfWaypoints(self):
        self.numberOfWaypoints = len(self.waypoints)
        return self.numberOfWaypoints

    # Sum distances between each cell
    def getTotalLength(self):
        
        total = 0
        prev = self.waypoints[0]
        for cell in self.waypoints:
            total += cell.distanceToCell(prev)
            prev = cell
        
        self.pathTravelCost = total

        return total

    # Difference of two angles -pi < x < pi
    def diffAngle(self, a, b):
        diff = a - b
        while diff < -180: diff += 360
        while diff > 180: diff -= 360
        return diff

    # Sum angles turned between each cell
    def getTotalAngle(self):

        total = 0
        currentangle = 0
        prev = self.waypoints[0]
        for cell in self.waypoints:
            angle = prev.angleToCell(cell)
            total += abs(self.diffAngle(currentangle, angle))
            currentangle = angle
            prev = cell

        self.angleTurned = total

        return total

