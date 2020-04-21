function in = qcontains(list, nodeid)
    % return true if the node id is in the list, otherwise false
    % 
    % Input:
    %   list    (vector)
    %   nodeid  (scalar)
    %
    % Output:
    %   in (logical)
    output = list(list==nodeid);
    if isempty(output)
        in = false;
    else
        in = true;
    end 
        

end
