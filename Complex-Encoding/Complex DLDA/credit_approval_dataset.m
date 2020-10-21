clear all
e = importdata('le-Credit-Approval.csv', ',');

X_to_ce = uint8(e(:,7:15));
X_cont = e(:,1:6);
y = uint8(e(:,16));

cX = zeros(size(X_to_ce,1), size(X_to_ce,2));
for ii=1:size(X_to_ce,2)
   cX(:,ii) = ComplexMapping(X_to_ce(:,ii)); 
end

%dropped 8th columns because of low variance
X = [X_cont cX];
X = [X(:,1:7) X(:,9:15)];

dlda = 0;
d = size(X,2);
p1 = sum(y==1)/length(y);

[cX0, cX1] = getDataClassified(X,y,d);

k = 0;
error = [];

while k<500
   k = k + 1;

   [cXTr0, cXTr1, cXTest0, cXTest1] = train_split_test(cX0, cX1, 0.20); 
   [m0, m1, c, ci, n0, n1] = ComplexLDA_initial(cXTr0', cXTr1', dlda);
   error(k) = Complex_LDA_error(cXTest0', cXTest1', m0, m1, c, ci, p1);
end

error_LDA = mean(error);
error_LDA
