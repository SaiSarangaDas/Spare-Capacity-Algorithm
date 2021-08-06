function [a,b]=static_largestconncomp(c,d)
% The function successively computes the largest connected component of the
% network post diruption of nodes specified in a node list. It does
% not remove nodes based on any dynamic recalculation of centrality
% measures and does so statically based on a node list.
%
%  USAGE
%
% [a,b]=static_largestconncomp(c,d);
%
% INPUT ARGUMENTS
%   c - The network from which the given nodes have to be disrupted in that
%   order
%   d - The node list containing the node numbers to be removed in a
%   successive fashion
%
% OUTPUT ARGUMENTS
%   a - the graph from which the nodes specified in the node list have been
%   disrupted
%   b - an array containing the largest connected component in the network
%   post successive node deletions
%
% EXAMPLES
%
% The codeline mentioned below will disrupt the nodes mentioned in the node
% list 'd' from the network 'c'
% 
% [a,b]=static_largestconncomp(c,d);
%
% AUTHORS
% Sai Saranga Das M (Department of Biotechnology, IIT Madras)
% Dr. Karthik Raman (Department of Biotechnology, IIT Madras)

e=size(d);
b=[];
[g,h]=conncomp(c);
b(1,1)=max(h);
for i=1:1:e(1,2)
c=rmnode(c,d(1,i));
[g,h]=conncomp(c);
b(1,i+1)=max(h);
end
a=c;

