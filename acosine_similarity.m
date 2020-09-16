function [S] = acosine_similarity(A,a)
    n = size(A,1); % number of nodes in given graph
    u=A*A';

    n1=sum(A,2).^a;
    n2=sum(A,2).^(1-a);
    n11=repmat(n1,[1,n]);
    n12=repmat(n2',[n,1]);
    nn=n11.*n12;
    S=u./(nn+realmin);  
end

