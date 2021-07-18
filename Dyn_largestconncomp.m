%aa - list of target nodes
%a - size of the largest connected component post successive node deletion
%y - represents the type of centrality used (1 - betweenness centrality;
%2 - degree centrality)
%'k' - the disrupted graph post the deletion of all the target nodes
%Kindly note that the centrality measures are dynamically recalculated post
%successive node deletion
function [aa,a,k]=Dyn_largestconncomp(b,x,y)
a=[];
aa=[];
c=numnodes(b);
d=round((x/100)*c);
if y==1
e=betweenness_centrality(adjacency(b));
f=sort(e,'descend');
[g,h]=conncomp(b);
a(1,:)=max(h);
for i=1:1:d
j=1;
while e(j,1)~=f(1,1)
j=j+1;
end
b=rmnode(b,j);
[g,h]=conncomp(b);
a(:,i+1)=max(h);
aa(i,:)=j;
e=betweenness_centrality(adjacency(b));
f=sort(e,'descend');
end
aa=aa';
elseif y==2
e=[];
for i=1:1:numnodes(b)
e(i,:)=degree(b,i);
end
f=sort(e,'descend');
[g,h]=conncomp(b);
a(1,:)=max(h);
for i=1:1:d
j=1;
while e(j,1)~=f(1,1)
j=j+1;
end
b=rmnode(b,j);
[g,h]=conncomp(b);
a(:,i+1)=max(h);
aa(i,:)=j;
e=[];
for xx=1:1:numnodes(b)
e(xx,:)=degree(b,xx);
end
f=sort(e,'descend');
end
aa=aa';
else
msgbox('Kindly check the input parameters (centrality measure - 3rd input)','error');
return
end
k=b;


