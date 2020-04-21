function [newlist,nodeid] = qpop(list)
    % get a node id from the front of list and return an updated list. If the list is
    % empty return newlist as and nodeid as the empty value [].
    % 
    % Input:
    %   list    (vector)
    %
    % Output:
    %   newlist (vector)
    %   nodeid  (scalar)
    if ~isempty(list)
        nodeid = list(1);
        newlist = list(2:end);
    else 
        newlist = [];
        nodeid = []; 
    end 

end