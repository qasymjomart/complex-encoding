%%
%  adult dataset  %
clear all
e = importdata('le-adult.csv', ',');

X = uint8([e(:,1) e(:,2) e(:,3) e(:,4) e(:,5) e(:,6) e(:,7) e(:,8) e(:,10)]);
y = uint8(e(:,9));

%remove e7 because zero variance

cX = zeros(size(X,1), size(X,2));
for ii=1:size(X,2)
   cX(:,ii) = CMapping(X(:,ii)); 
end

dlda = 0;
d = size(X,2);
p1 = sum(y==1)/length(y);

[cX0, cX1] = getDataClassified(cX,y,d);
error = [];

k = 0;
while k<500
   k = k + 1;

   [cXTr0, cXTr1, cXTest0, cXTest1] = train_split_test(cX0, cX1, 0.20); 
   [m0, m1, c, ci, n0, n1] = CLDA_initial(cXTr0', cXTr1', dlda);
   error(k) = CLDA_error(cXTest0', cXTest1', m0, m1, c, ci, p1);
    
end

adult_error_LDA = mean(error)

%%

%bc dataset

clear all
e = importdata('le-bc.csv', ',');

X = uint8([e(:,2) e(:,3) e(:,4) e(:,5) e(:,6) e(:,7) e(:,8) e(:,9)]);
y = uint8(e(:,1));

cX = zeros(size(X,1), size(X,2));
for ii=1:size(X,2)
   cX(:,ii) = CMapping(X(:,ii)); 
end

dlda = 0;
d = size(X,2);
p1 = sum(y==1)/length(y);

[cX0, cX1] = getDataClassified(cX,y,d);
error = [];

k = 0;
while k<500
   k = k + 1;

   [cXTr0, cXTr1, cXTest0, cXTest1] = train_split_test(cX0, cX1, 0.20); 
   [m0, m1, c, ci, n0, n1] = CLDA_initial(cXTr0', cXTr1', dlda);
   error(k) = CLDA_error(cXTest0', cXTest1', m0, m1, c, ci, p1);

end

bc_error_LDA = mean(error)


%%

%car dataset

clear all
e = importdata('le-car.csv', ',');

X = uint8([e(:,1) e(:,2) e(:,3) e(:,4) e(:,5) e(:,6)]);
y = uint8(e(:,7));

cX = zeros(size(X,1), size(X,2));
for ii=1:size(X,2)
   cX(:,ii) = CMapping(X(:,ii)); 
end

dlda = 0;
d = size(X,2);
p1 = sum(y==1)/length(y);

[cX0, cX1] = getDataClassified(cX,y,d);
error = [];

k = 0;
while k<500
   k = k + 1;

   [cXTr0, cXTr1, cXTest0, cXTest1] = train_split_test(cX0, cX1, 0.20); 
   [m0, m1, c, ci, n0, n1] = CLDA_initial(cXTr0', cXTr1', dlda);
   error(k) = CLDA_error(cXTest0', cXTest1', m0, m1, c, ci, p1);

end

car_error_LDA = mean(error)

%%

%credit approval dataset
clear all
e = importdata('le-Credit-Approval.csv', ',');

X_to_ce = uint8(e(:,7:15));
X_cont = e(:,1:6);
y = uint8(e(:,16));

cX = zeros(size(X_to_ce,1), size(X_to_ce,2));
for ii=1:size(X_to_ce,2)
   cX(:,ii) = CMapping(X_to_ce(:,ii)); 
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
   [m0, m1, c, ci, n0, n1] = CLDA_initial(cXTr0', cXTr1', dlda);
   error(k) = CLDA_error(cXTest0', cXTest1', m0, m1, c, ci, p1);
end

credit_error_LDA = mean(error)

%%

%heart dataset

clear all
e = importdata('le-heart.csv', ',');

X_to_ce = uint8(e(:,6:13));
X_cont = e(:,1:5);
y = uint8(e(:,14));

% X_to_ce = uint8([e3 e4 e5 e6 e7 e8 e9 e10]);
% X_cont = [e01 e02 e1 e2 e00];
% y = uint8(e11);

cX = zeros(size(X_to_ce,1), size(X_to_ce,2));
for ii=1:size(X_to_ce,2)
   cX(:,ii) = CMapping(X_to_ce(:,ii)); 
end

%6,7,8-th columns dropped because of low variance
X = [X_cont cX];
X = [X(:,1:7) X(:,9:13)];

dlda = 0;
d = size(X,2);
p1 = sum(y==1)/length(y);

[cX0, cX1] = getDataClassified(X,y,d);
error = [];

k = 0;
while k<500
   k = k + 1;
   [cXTr0, cXTr1, cXTest0, cXTest1] = train_split_test(cX0, cX1, 0.20); 
   [m0, m1, c, ci, n0, n1] = CLDA_initial(cXTr0', cXTr1', dlda);
   error(k) = CLDA_error(cXTest0', cXTest1', m0, m1, c, ci, p1);
end

heart_error_LDA = mean(error)


%%

%mushroom dataset

clear all
e = importdata('le-mushroom.csv', ',');

X = uint8([e(:,2:16) e(:,19:23)]);
y = uint8(e(:,1));

%remove e16 e17 because zero variance

cX = zeros(size(X,1), size(X,2));
for ii=1:size(X,2)
   cX(:,ii) = CMapping(X(:,ii)); 
end

dlda = 0;
d = size(X,2);
p1 = sum(y==1)/length(y);

[cX0, cX1] = getDataClassified(cX,y,d);
error = [];

k = 0;
while k<500
   k = k + 1;

   [cXTr0, cXTr1, cXTest0, cXTest1] = train_split_test(cX0, cX1, 0.20); 
   [m0, m1, c, ci, n0, n1] = CLDA_initial(cXTr0', cXTr1', dlda);
   error(k) = CLDA_error(cXTest0', cXTest1', m0, m1, c, ci, p1);

end

mushroom_error_LDA = mean(error)

%%

%voting dataset

clear all
e = importdata('le-voting.csv', ',');

X = uint8([e(:,1:16)]);
y = uint8(e(:,17));

cX = zeros(size(X,1), size(X,2));
for ii=1:size(X,2)
   cX(:,ii) = CMapping(X(:,ii)); 
end

dlda = 0;
d = size(X,2);
p1 = sum(y==1)/length(y);

[cX0, cX1] = getDataClassified(cX,y,d);
error = [];

k = 0;
while k<500
   k = k + 1;

   [cXTr0, cXTr1, cXTest0, cXTest1] = train_split_test(cX0, cX1, 0.20); 
   [m0, m1, c, ci, n0, n1] = CLDA_initial(cXTr0', cXTr1', dlda);
   error(k) = CLDA_error(cXTest0', cXTest1', m0, m1, c, ci, p1);

end

voting_error_LDA = mean(error)
