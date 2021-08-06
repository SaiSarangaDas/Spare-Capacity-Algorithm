function [q,y,z,sumfin]=bestedgedeglimit(a,deg)
% Computes the most cost efficient, 'best edge' (unit spare capacity) for a 
% network based on the number of connected components after ignoring 
% the zero degree nodes (if the network has only one connceted component
% the function returns a message to that effect).
%
% The essense of this function, which forms the core of our algorithm, is
% simple - we find the two largest connected components in the disrupted 
% graph and connect them, since this is the connection that will give us 
% the minimum finite path lengths per unit spare capacity. Then we compute 
% the sum of the finite path lengths between these two components for a 
% connection between a given node pair; lower this sum, the more cost 
% effective is the unit spare capacity (edge).
%
% Another concept that we use here is that of degree deviation. In real
% world networks, it is not economical (or practical) to increase the degree
% of a node (say the number of power lines (edges) of a power plant (node))
% over and above a certain limit. We include in our algorithm, an emperical
% constant termed as the degree deviation constraint, which imposes a limit
% on the increase in the degree of a node in the network during the 
% addition of spare capacity. 
%
% USAGE
%   [q,y,z,sumfin]=Bestedgedeglimit(a,deg)
%
% INPUT ARGUMENTS
%   a - the network for which spare capacity is to be added, 
%   deg - the degree deviation constraint (‘inf’ if no constraint is necessary).
%
% OUTPUT ARGUMENTS
%    q - a vector containing the list of all possible node pairs between 
%    the two largest connected components in the network in an increasing 
%    order of the sum of finite path lengths of the network 
%    post the addition of an edge between the given node pair
%    y - the network with the added unit spare capacity
%    z - the node pair for which the spare capacity is added
%    sumfin - the sum of finite path lengths of the network post unit 
%    spare capacity addition.
%
% EXAMPLES
%
% The codeline given below will find the best edge (unit spare capacity)
% for a network 'e' and will return the various output parameters mentioned
% above. The degree deviation constraint here is given as 'inf', implying
% no constraint in the increase in the degree of a given node during the
% addition of spare capacity
%    
% [a,b,c,d]=Bestedgedeglimit(e,inf);
%
%AUTHORS
% Sai Saranga Das M (Department of Biotechnology, IIT Madras)
% Dr. Karthik Raman (Department of Biotechnology, IIT Madras)

%Ignore all the zero degree nodes
%To find the two largest connected components in a graph. Vectors t and v
%will store the node numbers of the nodes present in these two connected
%components
[b,c]=conncomp(a);
d=sort(c,'descend');
e=size(b);
r=size(c);
if r(1,2)==1
msgbox('The Graph has no further requirement for spare capacity','Info');
return
else
s=[];
for i=1:1:r(1,2)
if c(1,i)==d(1,1)
s(1,i)=i;
else
end
end
s=nonzeros(s);
s=s';
t=[];
for i=1:1:e(1,2)
if b(1,i)==s(1,1)
t(1,i)=i;
else
end
end
t=nonzeros(t);
t=t';
u=[];
for i=1:1:r(1,2)
if c(1,i)==d(1,2)
u(1,i)=i;
else
end
end
u=nonzeros(u);
u=u';
v=[];
bb=size(u);
% Sometimes, the two largest connceted components in a network may have the
% same number of nodes in them. Hence to differentiate one connceted
% component with the other in these cases, the following 'if' condition is
% used
if bb(1,2)>1
for i=1:1:e(1,2)
if b(1,i)==u(1,2)
v(1,i)=i;
else
end
end
else
for i=1:1:e(1,2)
if b(1,i)==u(1,1)
v(1,i)=i;
else
end
end
end
v=nonzeros(v);
v=v';
w=size(t);
aa=size(v);
m=zeros(w(1,2),aa(1,2));
%To find the sum of all finite path lengths between all node pairs 
%in the connected components.
for i=1:1:w(1,2)
for j=1:1:aa(1,2)
a=addedge(a,t(1,i),v(1,j),1);
n=all_shortest_paths(adjacency(a));
m(i,j)=sum(n(isfinite(n)),'all');
a=rmedge(a,t(1,i),v(1,j));
end
end
%The optimal unit spare capacity is defined as the edge between node pair(s)
%that gives us the least sum of all finite paths of the resulting connected component
q=zeros((w(1,2)*aa(1,2)),3);
xx=1;
for i=1:1:w(1,2)
for j=1:1:aa(1,2)
q(xx,1)=t(1,i);
q(xx,2)=v(1,j);
q(xx,3)=m(i,j);
xx=xx+1;
end
end
q=sortrows(q,3);
rt=1;
jon=size(q);
while degree(a,q(rt,1))>=deg || degree(a,q(rt,2))>=deg
rt=rt+1;
if rt>jon(1,1)
    msgbox('Not feasible to design Spare Capacity under the given degree constraint','Info');
    return
else
end  
end
y=addedge(a,q(rt,1),q(rt,2),1);
z=[q(rt,1),q(rt,2)];
sumfin=q(rt,3);
end




