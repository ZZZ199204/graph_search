function newlist = qappend(list, nodeid)
    % add the node id to the end of the list and return an updated list 
    %
    % Input:
    %   nodeid  (scalar)
    %   list    (vector)
    %
    % Output:
    %    newlist (vector)
    if isscalar(nodeid)
        newlist = [list nodeid];
    else
        newlist = list;
    end 
end