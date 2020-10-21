function label = CDLDA_test(X, m0, m1, c, ci, p1)

% a_coeff = lda_coeff(1:size(lda_coeff,1)-1);
% b_coeff = lda_coeff(size(lda_coeff,1));

meanDiff=(m1- m0);
c = log(p1/(1-p1));   
w = X'*ci*meanDiff + meanDiff'*ci*X + m0'*ci*m0 - m1'*ci*m1 + c; %LDA discriminant 

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