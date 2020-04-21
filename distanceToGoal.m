function h = distanceToGoal(placeCoords,n,goalNode)
    % Unit (hr)
    % Compute distance from node "n" to "goalNode"
    current_node = placeCoords(:,n);
    goal_node = placeCoords(:,goalNode);
    % convert from km/hr to m/hr 
    h = sqrt(sum((current_node - goal_node).^2))/1e5;

      
end 
