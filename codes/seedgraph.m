function b=seedgraph(numnode,numedge)
% This function returns an seed graph having a given number of nodes
% and edges.
%
% USAGE
%
% b=seedgraph(numnode,numedges);
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
% b=seedgraph(10,10);
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
