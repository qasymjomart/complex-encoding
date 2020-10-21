function [m0, m1] = CNMC_initial(X0, X1)
    %Calculation of sample means
    
    m0 = mean(X0,2);
    m1 = mean(X1,2);   

end