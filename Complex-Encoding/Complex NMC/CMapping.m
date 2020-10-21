function [cX] = CMapping(X)

uX = unique(X);
cf = CEncoding(uX);

for ii=1:length(X)
    for jj=1:length(uX)
        if X(ii) == uX(jj)
           cX(ii) = cf(jj); 
        end
    end
end




