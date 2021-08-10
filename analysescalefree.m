function [a,b]=analysescalefree(numnode,stnode,stedges,counter,gamma)
% The function returns a scale free network with a given node number and
% gamma value using a seed graph whose size (in terms of both edges and nodes) 
% is given by the user
%
% USAGE
% 
% [a,b]=analysescalefree(numnode,stnode,stedges,counter,gamma);
%
% INPUT ARGUMENTS
%   numnode - number of nodes in the network
%   stnode - number of nodes in the seed graph
%   stedges - number of edges in the seed graph
%   counter -  an arbitrary counter to increase the standard deviation of
%   the degree distribution (this is done to generate scale free networks
%   of diverse gamma value)
%   gamma - the desired gamma value of the scale free network
%
% OUTPUT ARGUMENTS
%   a - the desired power law network
%   b - the slope (gamma value) and intercept of the log plot of degree
%   distribution
%  
%
% EXAMPLES
%
% The codeline mentioned below will return a scale free network of 200
% nodes from a seed graph of 10 nodes and 10 edges with a gamma value of 2.5.
% The value of the counter is 0.25.
%
% [a,b]= analysescalefree(200,10,10,0.25,2.5);
%
% AUTHORS
% Sai Saranga Das M (Department of Biotechnology, IIT Madras)
% Dr. Karthik Raman (Department of Biotechnology, IIT Madras)

a=directedpowerlaw(numnode,stnode,stedges,counter);
b=networkfit(a);
while round(b(1,1),1)~=-(gamma)
a=directedpowerlaw(numnode,stnode,stedges,counter);
b=networkfit(a);
end

