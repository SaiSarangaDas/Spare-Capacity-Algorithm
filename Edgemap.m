%A function to map the nodes of the disrupted network to that of the
%original network. 'b' is the original network, 'c' is the set of nodes
%that have been disrupted and d is the edge list whose node
%numbers have to be mapped to the original network.
function a=Edgemap(b,c,d)
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
