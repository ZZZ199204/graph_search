load('queensland_towns.mat');
% [p,f,e]=graph_Astar(distanceMatrix, placeCoords, placeNames, 5, 1)
[p,f,e]=graph_UCS(distanceMatrix, placeCoords, placeNames, 5, 1)
% [p,f,e]=graph_BFS(distanceMatrix, placeCoords, placeNames, 5, 1)
% [p,f,e]=graph_planner(distanceMatrix, placeCoords, placeNames, 5, 1)