#! /usr/bin/env python

# See run_fifo_standalone.py for documentation. The only difference is that
# a LIFO planner is created instead of a FIFO planner.
#! /usr/bin/env python

from comp313p_planner_controller.occupancy_grid import OccupancyGrid
from comp313p_planner_controller.AStarPlanner import AStarPlanner

# Create the occupancy grid
occupancyGrid = OccupancyGrid(21, 21, 0.5)

for y in xrange(1, 19):
    occupancyGrid.setCell(11, y, 1)

    
# Start and goal cells
start = (3, 18)
goal = (20, 0)

# Create the planner


heuristic_list = ['Zero', 'Constant', 'Euclidean', 'Manhattan', 'Octile']

for heuristic in heuristic_list:
    planner = AStarPlanner(str('A Star Algorithm - Heuristic: ' + str(heuristic)), occupancyGrid, heuristic, hscale=1/100.0);
    planner.setRunInteractively(True)
    planner.setWindowHeightInPixels(400)
# Search and see if a path can be found. Returns True if a path from the start to the
# goal was found and False otherwise
    goalReached = planner.search(start, goal)

# Extract the path. This is based on the last search carried out.
    path = planner.extractPathToGoal()
    print "Number of waypoints: %d" % path.getNumberOfWaypoints()
    print "Total angle during path: %d" % path.getTotalAngle()

#planner.setPauseTime(0)

# Run it
#planner.plan(start, goal)

# Pause
#planner.gridDrawer.waitForKeyPress()

# Show the path
#path = planner.extractPathToGoal()
#planner.gridDrawer.waitForKeyPress()


