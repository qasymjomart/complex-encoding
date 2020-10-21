function [XTr0, XTr1, XTest0, XTest1] = train_split_test(X0, X1, p)

kTrain0 = floor(length(X0)*(1-p));
kTrain1 = floor(length(X1)*(1-p));
kTest0 = length(X0) - kTrain0;
kTest1 = length(X1) - kTrain1;


indTest0 = randi([1 size(X0,1)], [1 kTest0]);
indTest1 = randi([1 size(X1,1)], [1 kTest1]);
ind0 = 1:size(X0,1);
ind1 = 1:size(X1,1);

intersect0 = ismember(ind0, indTest0);
intersect1 = ismember(ind1, indTest1);

indTr0 = [];
indTr1 = [];

for ii=1:size(X0,1)
    if intersect0(ii) == 0
        indTr0 = [indTr0 ind0(ii)];
    end
end

for ii=1:size(X1,1)
    if intersect1(ii) == 0
        indTr1 = [indTr1 ind1(ii)];
    end
end

XTr0 = X0(indTr0, :);
XTest0 = X0(indTest0, :);
XTr1 = X1(indTr1, :);
XTest1 = X1(indTest1, :);



