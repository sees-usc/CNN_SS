function [recon] = HM(OBS,Dict,A_hard,alpha)
nx = 40;                                                                   % number of blocks in each direction
ny = 120;
nz = 40;
siz = size(Dict);
vsize=siz(2);
v=zeros(vsize,1);
load LOGPERM_TRUE LOGPERM_TRUE
load logmean logmean
TRUE = LOGPERM_TRUE;
ITER_NUM = 0;
load wellloc wellloc
IND = wellloc;
vlast = ones(vsize,1);

while(ITER_NUM <3)
    vlast = v;
    ITER_NUM = ITER_NUM + 1
    [d_obs A] = func_linearization(Dict, v, A_hard, OBS,IND);
    v = function_update_v(A,d_obs);
end
recon = Dict*v+logmean;
end

