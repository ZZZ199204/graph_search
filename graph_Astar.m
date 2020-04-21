function [path,frontierList,exploredList] = graph_Astar(distanceMatrix, placeCoords, placeNames, startNode, goalNode)
    
    exploredList = [];  % nothing has been explored yet
    frontierList = startNode;  % put the starting node in the frontier
    parentNode = [];  % parentNode(i) is the number of the node which is the parent of node i
    g(startNode) = 0; % distance travelled to reach each node
    % do the breadth first search
    while length(frontierList) > 0  % while the frontier is not empty
      
        % get next node from frontier list, this is the node we are expanding
        [frontierList, expandingNode] = qpop(frontierList);
        fprintf('expanding node %d (%s)\n', expandingNode, placeNames{expandingNode});
       
        
        % check if we are there yet?
        if expandingNode == goalNode
            break;  % yes
        end
        
        % visit all the neighbours of the node being expanded
        for n = neighbours(distanceMatrix, expandingNode)  % for each neighbour
            if ~qcontains(frontierList, n) && ~qcontains(exploredList, n)
                % this neighbour is not on the frontier and is not explored
                g(n) = g(expandingNode) + distanceMatrix(expandingNode, n); % record the distance travelled
                f(n) = g(n) + distanceToGoal(placeCoords,n,goalNode);
                fprintf('  adding node %d (%s) to frontier, %.0f from start\n', n, placeNames{n}, g(n));
                frontierList = qinsert(frontierList,n,f);
                parentNode(n) = expandingNode;  % record how we got to this node
            end
            
            if qcontains(frontierList, n)
                gnew = g(expandingNode) + distanceMatrix(expandingNode, n);
                if gnew < g(n)
                   g(n) = gnew;
                   f(n) = g(n) + distanceToGoal(placeCoords,n,goalNode);
                   parentNode(n) = expandingNode;
                end
            end
            

        end
        % we are done with this node now, add it to the explored list
        exploredList = qappend(exploredList, expandingNode);
        fprintf('  adding node %d %s to explored list\n', expandingNode, placeNames{expandingNode});
        
    end
    
    % Now we need to reconstruct the path.  For each node we record it's parent
    % node, the node we arrived from.  Starting at the goal node, we find its
%     % parent, then the parent of that node, until we get to the start node
%     
    path = [];
    n = goalNode;  % set current node to the start

    while true
        path = [n path];    % prepend it to the path
        if n == startNode   % quit now if we have reached the starting node
            return
        end
        n = parentNode(n);  % find the parent of this node
    end
end






