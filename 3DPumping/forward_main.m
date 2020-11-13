function [P ADJOINT] = forward_main(Hyd_Con,Dic,coeffs,IND,flag_adj);
%==============================================
%flag_adj = 1 if you need adjoint,
%flag_adj = 0 if you do not  need adjoint,
load logmean logmean
logmean = logmean;
P =  pressure_calculation_main(Hyd_Con);
tic;
if flag_adj == 1
epsi_adj = 0.000001;  
ADJOINT = zeros(480,length(coeffs));
HC_perturb = zeros(192000,length(coeffs));
for i =1:length(coeffs)
	delta = zeros(length(coeffs),1);
    delta(i) = epsi_adj;
    coeff1 = coeffs + delta;
    HC_perturb(:,i) = Dic * coeff1+logmean;

end
   
parfor (i=1:length(coeffs),64)
    P1 = pressure_calculation_main(HC_perturb(:,i));
    P1 = P1(IND);
    P2 = P(IND); 
    ADJOINT(:,i) = (P1 - P2)/epsi_adj;

    
end
toc   
end

