function [q,y,z,gg]=Bestedgedeglimit(a,deg)
%Ignore all the zero degree nodes
%The essense of this function, which forms the core of our algorithm, is
%simple - we find the two largest connceted components in the disrupted graph and
%connect them, since this is the connection that will give us the minimum finite path
%lengths per unit spare capacity. Then we compute the sum of the finite path
%lengths between these two components; the lower the sum, the more cost
%effective is the unit spare capacity (edge).
%deg is a variable that will allow us to imposea ceiling on the degree of 
%a node above which spare capacity cannot be added.

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
o=min(m,[],'all');
%The optimal unit spare capacity is defined as the edge between node pair(s)
%that gives us the least sum of all finite paths of the resulting connected component
q=[];
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
gg=q(rt,3);
end




