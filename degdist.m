function w=degdist(e)
% This function returns the degree distribution of a network
%
% USAGE
% 
% w=degdist(e);
%
% INPUT ARGUMENTS
%   e - the network for which the degree distribution needs to be commputed
%  
% OUTPUT ARGUMENTS
%   w - the degree distribution of the network 'e'
%
% EXAMPLES
%
% The codeline mentioned below will return the degree distribution of the
% network 'e'
%
%  w=degdist(e);
%
% AUTHORS
% Sai Saranga Das M (Department of Biotechnology, IIT Madras)
% Dr. Karthik Raman (Department of Biotechnology, IIT Madras)

n=numnodes(e);
w=zeros(n);
for i=1:1:n
f=degree(e,i);
u=1;
if f==0
w(i,1)=0;
else
while(u~=f)
u=u+1;
end
w(i,u)=1;
end
end
w=sum(w);

