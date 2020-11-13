clear all;
close all; clc;
totals = 8;
k0 = [8;8;8;8;8;8;8;8];
load test8 test8
test = test8;
right1 = 0;
right2 = 0;
maxiter = 3;
confs = zeros(totals,testnpers);
ess = [];
kss = [];
tic;
for n = 1:8
    LOGPERM_TRUE = test(:,n);
    save LOGPERM_TRUE LOGPERM_TRUE
    [conf,n,es,ks] = Scenario_selection(LOGPERM_TRUE,k0,totals);
    [M,I] = max(conf);
    if conf(I) == conf(n)
        right1 = right1 + 1;
    end
    if conf(n) >0.125
        right2 = right2 + 1;
    end
    confs(:,n) = conf;
    ess = [ess es];
    kss = [kss ks];
end
