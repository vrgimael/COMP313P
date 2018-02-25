from cell_based_forward_search import CellBasedForwardSearch
from collections import deque
from cell import CellLabel
import math

class AStarPlanner(CellBasedForwardSearch):

    def __init__(self, title, occupancyGrid, heuristic, hscale=0):
        CellBasedForwardSearch.__init__(self, title, occupancyGrid)
        self.Queue = dict()
        self.Heuristic = heuristic
        self.Hscale = hscale

    # Add to dictionary with score as value
    def pushCellOntoQueue(self, cell):
        if cell.parent:
            cell.pathCost = cell.parent.pathCost + cell.distanceToCell(cell.parent)
        self.Queue[cell] = cell.pathCost + self.heuristic(cell)
    
    def heuristic(self, cell):
        if self.Heuristic == 'Zero':
            h = 0

        if self.Heuristic == 'Constant':
            h = 10
        
        if self.Heuristic == 'Euclidean':
            h = cell.distanceToCell(self.goal)

        if self.Heuristic == 'Manhattan':
            x = abs(cell.coords[0]-self.goal.coords[0])
            y = abs(cell.coords[1]-self.goal.coords[1])
            h = x+y

        if self.Heuristic == 'Octile':
            x = abs(cell.coords[0]-self.goal.coords[0])
            y = abs(cell.coords[1]-self.goal.coords[1])
            h = (x+y) + (math.sqrt(2) - 2)*min(x,y)

        return h * (1.0 + self.Hscale)

    # Check the queue size is zero
    def isQueueEmpty(self):
        return not self.Queue

    # Get cell with smallest score
    def popCellFromQueue(self):
        cell = min(self.Queue, key=self.Queue.get)
        del self.Queue[cell]
        return cell


    # If cell is alive, check for more efficient path
    def resolveDuplicate(self, cell, parentCell):
        if cell.label != CellLabel.DEAD:
            distance = parentCell.pathCost + cell.distanceToCell(parentCell)
            if distance < cell.pathCost:
                cell.pathCost = distance
                cell.parent = parentCell
                self.Queue[cell] = cell.pathCost + self.heuristic(cell)
            
