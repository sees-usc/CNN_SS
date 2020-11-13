function [confidence,n,es,ks] = Scenario_selection(LOGPERM_TRUE,k00,totals)
load PHI_ALL PHI_ALL
load logmean logmean
totalk = sum(k00);
[OBS,A_hard]= forward(LOGPERM_TRUE);
maxiter = 3;
es = [];
alpha = 1;
confidence = ones(totals,1);
es = zeros(5,4);
ks = zeros(5,4);
PHI = [];
for nf = 1:totals
    PHI1 = PHI_ALL(:,(nf-1)*100+1:(nf-1)*100+k00(nf));
    PHI = [PHI PHI1];
end
k=k00;
for n = 1:maxiter
    save PHI PHI
    fullmap = HM(OBS,PHI,A_hard,alpha);
    fullmap = reshape(reshape(fullmap,[100,100])',[10000,1]);
    save fullmap fullmap
    system(['python CNN'])
    load prob prob
    error = zeros(totals,1);
    for i = 1:totals
        error(i) = prob(i);
    end
    if n>1
        if norm(error-es(:,n-1))/norm(error) <= 0.05
            es(:,n) = error;
            confidence = error;
            break;
        end
    end
    es(:,n) = error;
    k0 = k;
    gradk = round(error.*k00/sum(error.*k00)*totalk)-k;
    k = round(k+alpha*gradk)
    ks(:,n)=k;
    if k==k0
        break;
    end
    PHI = [];
    for nf = 1:totals
        PHI1 = PHI_ALL(:,(nf-1)*100+1:(nf-1)*100+k(nf));
        PHI = [PHI PHI1];
        
    end
    alpha = alpha/2;
    
end
confidence = (k./k00)/sum(k./k00);
end



