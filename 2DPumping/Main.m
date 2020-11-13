clear all;
close all; clc;
totals = 5;
k0 = [19;9;9;6;6];
load test5 test5
test = test5;
testnpers = 50;
right1 = 0;
right2 = 0;
confidence = zeros(totals,totals);
maxiter = 3;
nmatrix = zeros(maxiter,totals);
confs = zeros(totals,testnpers);
ess = [];
kss = [];
reconhist = [];
for n1 = 1:totals
    n1
    for n2 = 1
        LOGPERM_TRUE = test(:,(n1-1)*100+n2);
        LOGPERM_TRUE = reshape(reshape(LOGPERM_TRUE,[100,100])',[10000,1]);
        save LOGPERM_TRUE LOGPERM_TRUE
        [conf,n,es,ks] = Scenario_selection(LOGPERM_TRUE,k0,totals);
        confidence(:,n1) = confidence(:,n1) + conf;
        [M,I] = max(conf);
        if conf(I) == conf(n1)
            right1 = right1 + 1;
        end
        if conf(n1) >0.2
            right2 = right2 + 1;
        end
        ess = [ess es];
        kss = [kss ks];
    end
end
