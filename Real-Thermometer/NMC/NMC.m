function [label] = NMC(m0, m1, X, alpha0)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   [labels]=NMC(mean,D)
% Nearest Mean Classifier for the case of c classes (equiprobable classes).
%
% INPUTs:
%   mean:  lxc matrix, with ith column being the mean of the ith
%          class.
%   D:  lxN matrix with columns being the observations (feature vectors) 
%          to be classified.
% OUTPUTs:
%   labels:  N-dimensional vector with ith element being the label
%       of the class to which the ith sample point has been assigned.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

meanDiff = m1 - m0;
W = (X - (m1 + m0)/2)*meanDiff + log((1-alpha0)/alpha0);
if W >= 0
    label = 1;
else
    label = 0;
end

% [l,c]=size(means);
% [l,N]=size(D);
% 
% for i=1:N
%     for j=1:c
%         dis(j)=sqrt((D(:,i)-means(:,j))'*(D(:,i)-means(:,j)));
%     end
% %     [num,labels(i)]=min(dis); 
%     if dis(1) < dis(2)
%         labels = 1;
%     else 
%         labels = 2;
%     end
% end