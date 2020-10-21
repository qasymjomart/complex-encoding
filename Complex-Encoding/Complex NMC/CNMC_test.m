function label = CNMC_test(X, m0, m1, p1)

meanDiff=(m1- m0);
pp = log(p1/(1-p1));   
w = X'*meanDiff + meanDiff'*X + m0'*m0 - m1'*m1 + pp; % NMC discriminant 

if w >= 0
    label = 1;
else 
    label = 0;
end

%disp(w)

%d = 11;

%g1 = -(X-m1)'*ci*(X-m1) - d*log(pi) - log(det(c)) + log(p1);
%g0 = -(X-m0)'*ci*(X-m0) - d*log(pi) - log(det(c)) + log(1-p1);

%if real(g1) >= real(g0)
%   label = 1; 
%else
%   label = 0; 
%end

end