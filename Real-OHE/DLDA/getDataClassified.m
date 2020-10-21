function [X0, X1] = getDataClassified(X,y,d)

X0 = zeros(sum(y==0),d);
X1 = zeros(sum(y==1),d);
i0 = 0;
i1 = 0;

for i=1:length(y)
   if y(i) == 0
       i0 = i0 + 1;
       X0(i0, :) = X(i, :); 
   elseif y(i) == 1
       i1 = i1 + 1;
       X1(i1, :) = X(i, :); 
   end
end