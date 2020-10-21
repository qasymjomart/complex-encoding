function [m0, m1, C, ci, n0, n1] = CDLDA_initial(X0, X1, dlda)
    %Calculation of sample means
    
    m0 = mean(X0,2);
    m1 = mean(X1,2);   
    n0=size(X0,2);
    n1=size(X1,2);

    C0 =  (X0 - m0) * (X0-m0)'/(n0-1);   
    C1 =  (X1 - m1) * (X1-m1)'/(n1-1);

    C = ((n0 - 1) * C0 + (n1 - 1) * C1) / (n0 + n1 - 2); %pooled sample covariance matrix
    
    if dlda == 1
        for ii=1:size(C,1)
            for jj=1:size(C,2)
                if ii ~= jj
                   C(ii,jj) = 0; 
                end
            end
        end
    end
    
    ci = inv(C);
    
%     meanMid=(m0 + m1) / 2;
%     meanDiff=(m0 - m1);
%     c = -log((1-alpha0)/alpha0);
%     b =  -meanMid' * ci * meanDiff+c; % the intercept of LDA
%     a =  ci * meanDiff; % the vector coefficients of LDA
%     lda_coeff = [a', b]';
end