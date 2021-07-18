%a - network that is targeted for disruption. x- fraction of nodes to be
%removed (as a percentage of the total number of nodes in the network)
%'y' - the centrality measure (1 - betweenness centrality, 2- degree centrality)
%'z' - number of edges of spare capacity as a proportion of the total edges
%of 'a'.
%Edge mapped spare capacity 'h', post node mapping, is added to the output
%graph 'l'. 'd'is the disrupted graph. 'deg' imposes an emperical constraint on the maximum degree to which
%a node in the disrupted graph can handle as spare capacity
function [l,d,h,m]=Optimspare(a,x,y,z,deg)
[b,c,d]=Dyn_largestconncomp(a,x,y);
aa=round((z/100)*numedges(a));
[e,f,m]=Spare(d,aa,deg);
%To map the nodes of the disrupted network to that of the original network
b=Nodemap(a,b);
h=Edgemap(a,b,f);
k=size(h);
l=a;
for i=1:1:k(1,1)
l=addedge(l,h(i,1),h(i,2),1);
end