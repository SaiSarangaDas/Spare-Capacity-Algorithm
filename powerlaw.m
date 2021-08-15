function b=powerlaw(numnode,stnode,stedges,counter)
% The function returns a scale free network with a given node number
% using a seed graph whose size (in terms of both edges and nodes) 
% is given by the user. Generally, the number edges of the
% seed graph should be equal to or greater than the number of nodes
% if the user wants to generate scale free networks where most of the nodes 
% are represented in a single connected component. 
% 
% USAGE
% 
% b=powerlaw(numnode,stnode,stedges,counter);
%
% INPUT ARGUMENTS
%   numnode - number of nodes in the network
%   stnode - number of nodes in the seed graph
%   stedges - number of edges in the seed graph
%   counter -  an arbitrary non negative value to increase the standard 
%   deviation of the degree distribution (this is done to generate scale 
%   free networks of diverse gamma value)
%  
% OUTPUT ARGUMENTS
%   b - the desired power law network  
%
% EXAMPLES
%
% The codeline mentioned below will return a scale free network of 200
% nodes from a seed graph of 10 nodes and 10 edges.
% The value of the counter is 0.25.
%
%  b=powerlaw(200,10,10,0.25);
%
% AUTHORS
% Sai Saranga Das M (Department of Biotechnology, IIT Madras)
% Dr. Karthik Raman (Department of Biotechnology, IIT Madras)

b=seedgraph(stnode,stedges);
while stnode<numnode
c=zeros(1,stnode);
e=zeros(1,stnode);
x=[1:stnode];
for i=1:1:stnode
c(1,i)=degree(b,i);
end
d=sum(c);
for i=1:1:stnode
e(1,i)=c(1,i)/d;
end
%using a counter to increase the standard deviation of the degree
%distribution. This is done by arbitrarily increasing the weights of nodes
%of intermediate degree.
for i=1:1:stnode
if e(1,i)<mean(e)
e(1,i)=e(1,i)+counter;
else
end
end
f=randsample(x,1,true,e);
b=addnode(b,1);
stnode=stnode+1;
b=addedge(b,f,stnode,1);
end
