#! /usr/bin/env python

# See run_fifo_standalone.py for documentation. The only difference is that
# a LIFO planner is created instead of a FIFO planner.
#! /usr/bin/env python

from comp313p_planner_controller.occupancy_grid import OccupancyGrid
from comp313p_planner_controller.DijkstraPlanner import DijkstraPlanner

# Create the occupancy grid
occupancyGrid = OccupancyGrid(21, 21, 0.5)

for y in xrange(1, 19):
    occupancyGrid.setCell(11, y, 1)

    
# Start and goal cells
start = (3, 18)
goal = (20, 0)

# Create the planner
planner = DijkstraPlanner('Dijkstra Planner', occupancyGrid);

planner.setRunInteractively(True)
planner.setWindowHeightInPixels(400)

# Search and see if a path can be found. Returns True if a path from the start to the
# goal was found and False otherwise
goalReached = planner.search(start, goal)

# Extract the path. This is based on the last search carried out.
path = planner.extractPathToGoal()

#planner.setPauseTime(0)

# Run it
#planner.plan(start, goal)

# Pause
#planner.gridDrawer.waitForKeyPress()

# Show the path
#path = planner.extractPathToGoal()
#planner.gridDrawer.waitForKeyPress()


print "Number of Waypoints: %d" % path.getNumberOfWaypoints()
print "Total angle turned on planned path: %d" % path.getTotalAngle()