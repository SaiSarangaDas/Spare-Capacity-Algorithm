%A function to map the nodes of the disrupted network to that of the
%original network. 'b' is the original network, 'c' is the set of nodes
%that have been disrupted from 'b' (using Dyn_largestconncomp.m).
function a=Nodemap(b,c)
d=size(c);
a=zeros(1,d(1,2));
e=[1:numnodes(b)];
f=[1:numnodes(b)];
g=size(c);
for i=1:1:g(1,2)
    h=[e;f];
    k=1;
    while h(2,k)~=c(1,i)
        k=k+1;
    end
    a(1,i)=h(1,k);
    e=setdiff(e,a(1,i));
    f=[1:numnodes(b)-i];
end
