from cell_based_forward_search import CellBasedForwardSearch
from collections import deque
from cell import CellLabel
import math

class DijkstraPlanner(CellBasedForwardSearch):

    def __init__(self, title, occupancyGrid):
        CellBasedForwardSearch.__init__(self, title, occupancyGrid)
        self.Queue = dict()

    # Path Cost is Euclidean Distance. Smaller score = better.
    # Add to dictionary with score as value
    def pushCellOntoQueue(self, cell):
        if cell.parent:
            cell.pathCost = cell.parent.pathCost + cell.distanceToCell(cell.parent)
        self.Queue[cell] = cell.pathCost
    
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
                self.Queue[cell] = distance
            
