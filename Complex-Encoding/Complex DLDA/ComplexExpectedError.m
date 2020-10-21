clear all
clc

randn('seed', 0);
cc=0;
nn=60:50:510;
for ii=1:length(nn)
    n = nn(ii);
    k = 0;
    cc = cc + 1;
    error = zeros(500,1);
    while k<500
       k = k + 1;
       [X, y] = generateComplexDist(n);    
       error(k) = ComplexCalculate(X, y, 0, 0);    
    end
       error_LDA(cc) = mean(error);
    fprintf('Doing LDA n=%d \n', n);
end

figure;
plot(nn,error_LDA);
grid on;
title('Estimated errors for Complex LDA');
xlabel('n');
ylabel('Estimated error');