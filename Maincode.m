function [b,c,d,rr,oo,n,f,l]=Maincode(a,x,y,z,deg)
%b,c and d - the original network with spare capacity, disrupted network
%and the edge mapped spare capacity respectively.
%'deg' - an emperical constraint representing the maximum degree upto which a node 
%in the disrupted network can absorb spare capacity. 
%oo- the normalized cost of the network with added spare capacity
[b,c,d,oo]=Optimspare(a,x,y,z,deg);
qq=size(d);
rr=zeros(qq(1,1),2);
for i=1:1:qq(1,1)
rr(i,1)=degree(b,d(i,1));
rr(i,2)=degree(b,d(i,2));
end
[e,f,g]=Dyn_largestconncomp(a,x,y);
[k,l]=Static_largestconncomp(b,e);
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