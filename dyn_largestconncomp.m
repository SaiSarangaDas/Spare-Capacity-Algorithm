function [aa,a,k]=dyn_largestconncomp(b,x,y)
% Used to disrupt nodes successively based on either betweenness or degree
% centrality. The respective centrality measures are recalculated post
% each node disruption
%
% USAGE
%
% [aa,a,k]=dyn_largestconncomp(b,x,y);
%
% INPUT ARGUMENTS
%   b - the network whose nodes are to be disrupted
%   x - fraction of nodes to be disrupted as a percentage of the total
%   number of nodes in the network
%   y - represents the type of centrality used (1 - betweenness centrality;
%   2 - degree centrality)
%
% OUTPUT ARGUMENTS
%   aa - list of target nodes
%   a - size of the largest connected component post successive node deletion
%   k - the disrupted graph post the deletion of all the target nodes
%
% EXAMPLES
%
% The codeline mentioned below will dynamically disrupted the top 10
% percent of the nodes in the network 'b' based on betweenness centrality.
% The centrality measure is recalculated post the disruption of each node
%
% [aa,a,k]=dyn_largestconncomp(b,10,1);
%
% AUTHORS
% Sai Saranga Das M (Department of Biotechnology, IIT Madras)
% Dr. Karthik Raman (Department of Biotechnology, IIT Madras)
d=(round((x/100)*numnodes(b)));
aa=zeros(1,d);
a=zeros(1,(d+1));
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
        aa(1,i)=j;
        e=betweenness_centrality(adjacency(b));
        f=sort(e,'descend');
    end
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
        aa(1,i)=j;
        e=[];
        for xx=1:1:numnodes(b)
            e(xx,:)=degree(b,xx);
        end
        f=sort(e,'descend');
    end
else
    msgbox('Kindly check the input parameters (centrality measure - 3rd input)','error');
    return
end
k=b;


