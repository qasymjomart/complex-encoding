function [cf] = CEncoding(uX)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ComplexEncoding function get the list of unique values of the particular
%      variable (feature) and returns the list of corresponding complex encoding variables.
% For example, if there are four categories in the variable X, the encoded
%      forms are 1, -1, j, -j.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


nf = length(uX);
alpha = 0;
alpha0 = 360/nf;
cf = [];

for ii=0:nf-1
    alpha = alpha0*ii;
    ar = cosd(alpha);
    bi = sind(alpha);
    z = complex(ar, bi);
    cf = [cf; z];
end