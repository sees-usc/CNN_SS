function [OBS,A_hard] = forward(TRUE)
[P_true] = pressure_calculation(TRUE);
load IND3 IND3
IND = IND3;
OBS_P = P_true(IND);

A_hard = zeros(length(IND),length(TRUE(:)));
for i=1:length(IND)
    A_hard(i,IND(i)) = 1;
end
OBS_HD = A_hard*TRUE(:);

OBS = [OBS_P;OBS_HD];
end

