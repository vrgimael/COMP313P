from cell_based_forward_search import CellBasedForwardSearch
from collections import deque
from cell import CellLabel
import math

class BestFirstPlanner(CellBasedForwardSearch):

    def __init__(self, title, occupancyGrid):
        CellBasedForwardSearch.__init__(self, title, occupancyGrid)
        self.Queue = dict()

    # Score is Euclidean Distance to goal. Smaller score = better.
    # Add to dictionary with score as value
    def pushCellOntoQueue(self, cell):
        score = cell.distanceToCell(self.goal)
        self.Queue[cell] = score
    
    # Check the queue size is zero
    def isQueueEmpty(self):
        return not self.Queue

    # Get cell with smallest score
    def popCellFromQueue(self):
        cell = min(self.Queue, key=self.Queue.get)
        del self.Queue[cell]
        return cell

    def resolveDuplicate(self, cell, parentCell):
        # Nothing to do in this case
        pass
