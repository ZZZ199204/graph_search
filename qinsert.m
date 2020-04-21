function [newlist,nodeid] = qinsert(list, nodeid, cost)
    % insert the node id into the list and return an updated list.  The node is inserted
    % at a location such that the cost of the nodes is non-decreasing in magnitude.
    % cost is a vector such that cost(i) is the cost of node i. It is guaranteed that
    % cost will be a vector with length at least equal to the maximum nodeid.
    % If multiple nodes have the same cost, their relative ordering does not matter.
    %
    %
    % Input:
    %   list    (vector)
    %   nodeid  (scalar)
    %   cost    (vector)
    %
    % Output:
    %   newlist (vector)

    % Find minimum cost index larger than or equal to nodeid 
    list = [list nodeid];
    temp_cost = cost(list);
    temp_matrix = [list; temp_cost]';
    temp_matrix = sortrows(temp_matrix,2);
    
    newlist = temp_matrix(:,1)';    
    
    

end