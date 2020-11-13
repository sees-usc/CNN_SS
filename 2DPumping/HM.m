function [recon] = HM(OBS,Dict,A_hard,alpha)
siz = size(Dict);
vsize=siz(2);
v=zeros(vsize,1);
load LOGPERM_TRUE LOGPERM_TRUE
load logmean logmean
TRUE = LOGPERM_TRUE;
load IND3 IND3
IND = IND3;
nx = 100;
ny = 100;

for i = 1:10
    vlast = v;
    
    [d_obs A] = func_linearization(Dict, v, A_hard, OBS,IND);
    v = function_update_v(A,d_obs,alpha);
    figure (2)
    colormap jet
    subplot(4,5,i)
    imagesc(reshape(Dict*v+logmean,nx,ny));
    if norm(v-vlast)/norm(v) <0.01
        break
    end
end
recon = Dict*v+logmean;
end

