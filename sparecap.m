function [d,y,normcost]=sparecap(a,b,deg)
% The function calculates the most efficient set of spare capacity for a 
% disrupted network. The number of edges added depends on the input arguments 
% of the user.
% sparecap.m uses the following function:
% bestedgedeglimit.m 
%
% 
% USAGE
%
% [d,y,z]=sparecap(a,b,deg)
%
% INPUT ARGUMENTS
%   a - the disrupted network for which spare capacity needs to be added
%   b - Quantum of spare capacity that needs to be added (number of spare
%   edges that should be added to the disrupted network)
%   deg - the degree deviation constraint (‘inf’ if no constraint is necessary).
%   
% OUTPUT ARGUMENTS
%   d - The network with added spare capacity
%   y - the unmapped edge list of spare capacity
%   normcost - the normalized cost of the network with added spare capacity
%   
% 
% EXAMPLES
%
% The codeline written below will generate a set of 10 edges as the spare 
% capacity set for the network 'a'. Degree deviation constraint is given 
% as 5.
% 
% [d,y,z]=sparecap(a,10,5);
% 
%AUTHORS
% Sai Saranga Das M (Department of Biotechnology, IIT Madras)
% Dr. Karthik Raman (Department of Biotechnology, IIT Madras)

y=[];
normcost=zeros(1,1);
x=a;
for i=1:1:b
[c,x,e,gg]=bestedgedeglimit(x,deg);  
y(i,:)=e;
normcost(1,1)=normcost(1,1)+gg;
end
d=x;

