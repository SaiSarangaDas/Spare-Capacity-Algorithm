function [b,c,d,moddeg,normcost,n,f,l]=robustnessvalue(a,x,y,z,deg)
% The function computes the 'R' value (indicator of network robustness) ]
% with and without spare capacity for a given network
% robustnessvalue.m uses the following functions:
% mappedsparecap.m; dyn_largestconncomp.m; static_largestconncomp.m
%
% USAGE
%
% [b,c,d,moddeg,normcost,n,f,l]=robustnessvalue(a,x,y,z,deg);
%
% INPUT ARGUMENTS
%   a - the network to be disrupted
%   x - the number of nodes to be disrupted from the network (as a percentage
%   of the total number of nodes in the network)
%   y - the centrality measure (1-betweenness centrality; 2-degree centrality),
%   z - quantum of spare capacity to be added to the network (as a percentage
%   of the total number of edges in the original network)
%   deg - the degree deviation constraint (‘inf’ if no constraint is necessary).
%
% OUTPUT ARGUMENTS
%   b - the original network with spare capacity
%   c - the disrupted network
%   d - the edge mapped spare capacity
%   moddeg - the degree of the nodes in the original network in which
%   spare capacity has been added
%   normcost - the normalized cost of the network with added spare capacity
%   n - an array that stores in increasing order the fraction of nodes that
%   are successively removed from the graph based on a centrality measure
%   (the x axis of the robustness graph)
%   f -an array that stores the size of the largest connected component of
%   the network without spare capacity post successive node deletions
%   l - an array that stores the size of the largest connected component of
%   the network with spare capacity post successive node deletions
%   (f and l are computed for the generation of the R value for the network
%   without (Ro) and with spare capacity (R) respectively).
%
% EXAMPLES
%
% The codeline mentioned below will return the robustness values of the
% network with and without spare capacity for every successive node
% disruption using betweenness centrality as the measure for node disruption
% Total number of nodes disrupted - 20% of the total number of nodes
% in the network
% Mode of network disruption - betweenness centrality
% Quantum of spare capacity added - 5% of the total number of edges in the
% original network
% Degree deviation constraint - inf
%
% [b,c,d,moddeg,normcost,n,f,l]=robustnessvalue(a,20,1,5,inf);
%
% The codeline mentioned below will return the robustness values of the
% network with and without spare capacity for every successive node
% disruption using degree centrality as the measure of node disruption
% Total number of nodes disrupted - 10% of the total number of nodes
% in the network
% Mode of network disruption - degree centrality
% Quantum of spare capacity added - 2% of the total number of edges in the
% original network
% Degree deviation constraint - inf
%
% [b,c,d,moddeg,normcost,n,f,l]=robustnessvalue(a,10,2,2,inf);
%
% AUTHORS
% Sai Saranga Das M (Department of Biotechnology, IIT Madras)
% Dr. Karthik Raman (Department of Biotechnology, IIT Madras)

[b,c,d,normcost]=mappedsparecap(a,x,y,z,deg);
qq=size(d);
moddeg=zeros(qq(1,1),2);
for i=1:1:qq(1,1)
    moddeg(i,1)=degree(b,d(i,1));
    moddeg(i,2)=degree(b,d(i,2));
end
[e,f,g]=dyn_largestconncomp(a,x,y);
[k,l]=static_largestconncomp(b,e);
m=size(l);
%n - an array that stores in increasing order the fraction of nodes that are
%successively removed from the graph(the x axis of the
%robustness graph),
%f and l - an array that stores the size of the largest connected component of
%the network post successive node deletions without and with spare capacity spare capacity
%respectively.
n=[round((1-(x/100))*numnodes(a)):numnodes(a)];
n=sort(n,'descend');
for i=1:1:m(1,2)
    n(1,i)=1-(n(1,i)/numnodes(a));
end
for i=1:1:m(1,2)
    f(1,i)=f(1,i)/(numnodes(a)-(i-1));
    l(1,i)=l(1,i)/(numnodes(a)-(i-1));
end
