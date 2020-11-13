function [d_obs A] = func_linearization(Dict, v, A_hard,OBS,IND);

load logmean logmean
KXPAR = v;
kxfull = Dict * v + logmean;
[P_update Grad] = forward_main(kxfull,Dict,KXPAR,IND,1);  % forward run for jacobian calculation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
G = [Grad;A_hard*Dict];
dd_1 = [P_update(IND) - Grad * KXPAR;  0 * A_hard * Dict * KXPAR];
d_o = OBS - dd_1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%   adding Cn
vec1 = 1/norm(OBS(1:end/2)) * ones(length(OBS)/2,1);
vec2 = 1/norm(OBS(end/2+1:end)) * ones(length(OBS)/2,1)/15;
vec = [vec1;vec2];
Cn = diag(vec);
d_obs = Cn * d_o;
A = Cn * G;