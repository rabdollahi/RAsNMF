function [S] = citation_similarity(A, beta)
n = size(A, 1); % number of nodes in given graph
S = (eye(n) - beta*A)^(-1);
S = S + S';
S(logical(eye(size(S)))) = 1;
end