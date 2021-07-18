% To successively find the largest connected component in a graph 'c' post removal of a 
%set of nodes specified in vector 'd'.
function [a,b]=Static_largestconncomp(c,d)
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
