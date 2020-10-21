function [error, alpha] = ComplexCalculate(X, y, labelencoded, split, dlda)

%If label encoded input is provided, then complex encoding (mapping) is required
%otherwise it is assumed that the input is already complex encoded

if labelencoded == 1
    cX = zeros(size(X,1), size(X,2));
    for ii=1:size(X,2)
       cX(:,ii) = ComplexMapping(X(:,ii)); 
    end
else
    cX = X;
end

d = size(X,2);

[cX0, cX1] = getDataClassified(cX,y,d);

if split == 1
    [cXTr0, cXTr1, cXTest0, cXTest1] = train_split_test(cX0, cX1, 0.20);
else
   [XTest, y] =  generateComplexDist(1000);
   cXTest0 = XTest(1:1000,:);
   cXTest1 = XTest(1001:2000,:);
   cXTr0 = cX0;
   cXTr1 = cX1;
end

[m0, m1, c, ci, n0, n1] = ComplexLDA_initial(cXTr0', cXTr1', dlda);

p1 = sum(y==1)/length(y);

error = Complex_LDA_error(cXTest0', cXTest1', m0, m1, c, ci, p1);

alpha = 1 - p1;

end