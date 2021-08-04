function a=edgemap(b,c,d)
% The function is used to map the node pairs that constitute the spare 
% capacity to that of the original network (without node disruption). MATLAB 
% dynamically renumbers all the nodes downstream of a disrupted node; 
% hence this function is necessary since the computation of spare capacity
% is done on a disrupted network
%
% USAGE
%
% a=edgemap(b,c,d);
%
% INPUT ARGUMENTS
%   b - The original (undisrupted) network
%   c - the set of nodes that that have been disrupted 
%   from the original network (the node numbers should have been previously 
%   mapped to that of the original network using nodemap.m)
%   d - the unmapped edge list representing spare capacity of the network
%   
% OUTPUT ARGUMENTS
%   a - The edge map containing the list of node pairs whose nodes have
%   been mapped to that of the original network
%   
%
% EXAMPLES
%
% The codeline mentioned below will return the egde map 'a' for the edge list
% 'd' using the list of nodes 'c' disrupted from the original network 'b'
% 
% a=edgemap(b,c,d);
%
% AUTHORS
% Sai Saranga Das M (Department of Biotechnology, IIT Madras)
% Dr. Karthik Raman (Department of Biotechnology, IIT Madras)

x=numnodes(b);
y=[1:x];
e=setdiff(y,c);
f=size(d);
a=zeros(f(1,1),f(1,2));
for i=1:1:f(1,1)
j=d(i,1);
k=e(1,j);
a(i,1)=k;
l=d(i,2);
m=e(1,l);
a(i,2)=m;
end

