function [l,d,h,normcost]=mappedsparecap(a,x,y,z,deg)
% The function returns the edge mapped spare edges for the network. The
% number of edges added depends on the input arguments of the user.
% mappedsparecap.m uses the following functions:
% nodemap.m; edgemap.m; 
%
% 
% USAGE
%
% [l,d,h,m]=mappedsparecap(a,x,y,z,deg);
%
% INPUT ARGUMENTS
%   a - the network to be disrupted
%   x - the number of nodes to be disrupted from the network (as a percentage 
%   of the total number of nodes in the network)
%   y - the centrality measure (1-betweenness centrality; 2-degree centrality), 
%   z - quantum of spare capacity to be added to the network (as a percentage 
%   of the total number of edges in the original network)
%   deg - the degree deviation constraint (‘inf’ if no constraint is necessary)
%   
% OUTPUT ARGUMENTS
%   l - the original network with added spare capacity
%   d - the original network disrupted by the centrality measure specified
%   h - the edge list (spare capacity) between node pairs whose node numbers 
%   have been mapped to the original network
%   m -normalized cost of the network with added spare capacity.
% 
% EXAMPLES
%
% The codeline written below will generate mapped spare edges for the
% original network 'a' when 10% of the nodes in the network are removed
% using degree centrality as the measure of node disruption. Quantum of
% spare capacity added to the network is 5%. Degree deviation constraint is
% given as inf.
% 
% [l,d,h,m]=mappedsparecap(a,10,2,5,inf);
%
% The codeline written below will generate the spare capacity set for the
% original network 'a' when 10% of the nodes in the network are removed
% using betweenness centrality as the measure of node disruption. Quantum of
% spare capacity added to the network is 2%. Degree deviation constraint is
% given as 5 implying that the degree of any given node in the disrupted 
% network cannot increase over 5 during the process of spare capacity addition.
% 
% [l,d,h,m]=mappedsparecap(a,10,1,2,5);
%
%AUTHORS
% Sai Saranga Das M (Department of Biotechnology, IIT Madras)
% Dr. Karthik Raman (Department of Biotechnology, IIT Madras)

[b,c,d]=dyn_largestconncomp(a,x,y);
aa=round((z/100)*numedges(a));
[e,f,normcost]=sparecap(d,aa,deg);
%To map the nodes of the disrupted network to that of the original network
b=nodemap(a,b);
h=edgemap(a,b,f);
k=size(h);
l=a;
for i=1:1:k(1,1)
l=addedge(l,h(i,1),h(i,2),1);
end
