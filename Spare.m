%For a given set of nodes, identify the spare capacity required for the network 
%a. The number of spare edges that can be added to the network is given by b. 
%'deg' imposes a constraint on the maximum degree upto which a node can
%absorb spare capacity.
function [d,y,z]=Spare(a,b,deg)
y=[];
z=zeros(1,1);
x=a;
for i=1:1:b
[c,x,e,gg]=Bestedgedeglimit(x,deg);  
y(i,:)=e;
z(1,1)=z(1,1)+gg;
end
d=x;
