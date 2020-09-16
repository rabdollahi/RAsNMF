function [S] = cosine_similarity2(A)
    n = size(A,1); % number of nodes in given graph
    u=A*A';
    n1=vecnorm(A,2,2);
    n11=repmat(n1,[1,n]);
    n12=repmat(n1',[n,1]);
    n2=n11.*n12;
    S=u./(n2+realmin);
end

