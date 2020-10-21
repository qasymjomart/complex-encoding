function [m0, m1] = NMCmeans(X0, X1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   [means] = NMCmeans(X))
% Meand Estimation for Nearest Mean Classifier for the case of c classes (equiprobable classes).
%
% INPUTs:
%   X1: Nxd dimensional matrix of training samples of class 1, where N is the sample size, d is the feature size 
%   X2: Nxd dimensional matrix of training samples of class 2, where N is the sample size, d is the feature size 
%
% OUTPUTs:
%   means: dxc mean matrix for each row of d feature and column for class c
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [N1,d] = size(X1);
% [N2,d1] = size(X2);


% for i=1:d
    m0 = mean(X0,2);
    m1 = mean(X1,2); 
% end

