function label = DLDA_test(X, m0, m1, ci, alpha0)

% a_coeff = lda_coeff(1:size(lda_coeff,1)-1);
% b_coeff = lda_coeff(size(lda_coeff,1));
% meanMid=(m1 + m0) / 2;
% meanDiff=(m1 - m0);
% c = log((1-alpha0)/alpha0);
% b =  -meanDiff' * ci * meanMid+c; % the intercept of LDA
% a =  ci * meanDiff;   
% w = X' * a + b; %LDA discriminant

c = log((1-alpha0)/alpha0);
meanMid=(m1 + m0) / 2;
meanDiff=(m1 - m0);
w = (X - meanMid)'*ci*meanDiff + c;

if w >= 0
    label = 1;
else
    label = 0;
end

end