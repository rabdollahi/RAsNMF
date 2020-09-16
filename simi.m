function [S,pr]=simi(A,type,a)
	n = size(A,1);
    if(type==1)
        [S] = cosine_similarity(A);
    elseif(type==2)
        beta = 0.01;
        [S] = citation_similarity(A, beta);
    elseif(type==3)
        S = A + A' + eye(n);
    elseif(type==4)
        pr = centrality(digraph(A),'pagerank');
        PR=repmat(pr,[1 n]);
        S=A.*PR;
    elseif(type==5)
        S = acosine_similarity(A,a);
    end

end