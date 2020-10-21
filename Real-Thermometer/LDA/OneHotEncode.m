function [ohe] = OneHotEncode(l)

% This functio gets the l (no. samples x no. features) matrix of label-encoded data
% and then converts it to a one-hot-encoded equivalent returning
% the matrix called ohe (no. samples x no. new features)

[~ ,v] = size(l);



for vv = 1:v
    ll = l(:, vv) + 1;
    ll_ohe = full(ind2vec(ll'));
    if vv == 1
       ohe = ll_ohe'; 
    else
       ohe = [ohe ll_ohe'];
    end
end
