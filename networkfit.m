function z=networkfit(b)
% This function returns the slope (gamma value) and the intercept of the log
% plot of the degree distribution of any (scale free) network
% 
% USAGE
% 
% z=networkfit(b);
%
% INPUT ARGUMENTS
%  b - the graph for which the respective parameters need to be found
%   
% OUTPUT ARGUMENTS
%   x - the slope and the intercept of the log plot of the degree distribution
%   of a network
%
% EXAMPLES
%
% The codeline mentioned below will return the slope and the intercept of 
% the log plot of the degree distribution of network 'b'
%  
% z=networkfit(b);
%
% AUTHORS
% Sai Saranga Das M (Department of Biotechnology, IIT Madras)
% Dr. Karthik Raman (Department of Biotechnology, IIT Madras)

c=degdist(b);
d=size(c);
e=d(1,2);
f=[1:e];
for i=1:1:e
if c(1,i)==0
f(1,i)=NaN;
c(1,i)=NaN;
else
end
end
x=log(f(~isnan(f)));
y=log(c(~isnan(c)));
z=polyfit(x,y,1);
