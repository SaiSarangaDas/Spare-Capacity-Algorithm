function a=nodemap(b,c)
% This function is used to map the node numbers of the nodes that were disrupted
% to that of the original network. MATLAB dynamically renumbers all the nodes
% downstream of a disrupted node; hence this function is necessary for mapping
% the nodes correctly so that the spare edges that are generated using
% 'bestedgedeglimit.m' are mapped correctly (also refer to edgemap.m)
%
% USAGE
%
% a=nodemap(b,c);
%
% INPUT ARGUMENTS
%   b - The original (undisrupted) network
%   c - the set of nodes that that have been successively disrupted from
%   the original network in the order of disruption
%
%
% OUTPUT ARGUMENTS
%   a - The node map containing the list of nodes that have been disrupted
%   mapped to that of the original network
%
% EXAMPLES
%
% The codeline mentioned below will return the node map 'a'
% for the original network 'b' using the list of disrupted nodes 'c'
%
% a=nodemap(b,c);
%
% AUTHORS
% Sai Saranga Das M (Department of Biotechnology, IIT Madras)
% Dr. Karthik Raman (Department of Biotechnology, IIT Madras)

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
