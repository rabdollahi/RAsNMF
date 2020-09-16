function [W1,D1] = initializeNMFwithSVD(A,k)

n = length(A);

[U,S,V] = svd(A);
W(:,1) = U(:,1); 
H(:,1) = V(:,1);
D(1,1) = S(1,1);

for j = 1:n
    x = U(:,j); y = V(:,j);
    xp = (x>=0).*x; xn = -x.*(~xp);
    yp = (y>=0).*y; yn = -y.*(~yp);
    
    xpnrm = norm(xp); ypnrm = norm(yp); mp = xpnrm * ypnrm; 
    xnnrm = norm(xn); ynnrm = norm(yn); mn = xnnrm * ynnrm;
    
    if mp >mn 
        u = xp/max(realmin,xpnrm); v=yp/max(ypnrm,realmin); sigma = mp;
    else
        u = xn/max(realmin,xnnrm); v= yn/max(realmin,ynnrm); sigma = mn;
    end
    W(:,j) = u; H(:,j) = v; D(j,j) = (sigma^2)*S(j,j);
    
end


D1 = D*H'*W;
D1 = D1(1:k,1:k);
W1 = W(:,1:k);

init = mean(mean(A));
%init = 0.0001;
%D1(D1==0) = init;
%W1(W1==0) = init;

D1(D1<init) = init;
W1(W1<init) = init;

end

