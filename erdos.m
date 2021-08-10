function b=erdos(numnode,numedge)
% This function returns an Erdos Reyni graph having a given number of nodes
% and edges. This function is mainly used to generate seed graphs of,say,
% 10 nodes and 10 edges that will inturn be used to build scale free 
% networks
%
% USAGE
% 
% b=erdos(numnode,numedges);
%
% INPUT ARGUMENTS
%   numnode - number of nodes in the network
%   numedges - number of edges in the network
%  
% OUTPUT ARGUMENTS
%   b - the desired Erdos_Reyni network  
%
% EXAMPLES
%
% The codeline mentioned below will return an Erdos_Reyni network of 10
% nodes and 10 edges 
%  
% b=erdos(10,10);
%
% AUTHORS
% Sai Saranga Das M (Department of Biotechnology, IIT Madras)
% Dr. Karthik Raman (Department of Biotechnology, IIT Madras)

a=ones(numnode);
b=graph(a, 'omitselfloops');
while numedges(b)>numedge
c=round(1+(numnode-1)*rand());
d=round(1+(numnode-1)*rand());
while c==d
d=round(1+(numnode-1)*rand());
end
b=rmedge(b,c,d);
end
end
