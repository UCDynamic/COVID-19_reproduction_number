


% %
pc = parcluster('local')
parpool(pc, 2)
x1 = [ 0.1e-4 0.1e-8 0.1e-15 0.1e-5 0.1e-8 0.1e-6 0.1e-8 0.1e-3 0.1e-4 0.1e-4 1e-8] % Lower bound of parameters
x2 = [1 1e-3 9e-15 1e-3 1e-3 1e-2 1e-3 1 1 1 1e-3] %Upper bound for parameters
A = [0 -1 0 0 2 0 0 0 0 0; 0 0 0 0 1 0 -1.5 0 0 0];
b = [0;0];
Aeq = [0 0 0 0 0 0 0 0 0 0];
beq = [0];
x
x0 =  [4.4020e-09,1.0005e-10,5.4308e-05,2.1123e-10, 1.8759e-10, 1.6735e-10,1.0291e-10,0.2312,4.6386e-06,0.2312]; % Array of initial values
%% using Gradient based Optimization

options = optimset('Display','iter','PlotFcns',@optimplotfval,'MaxIter', 500, 'TolX',1e-9);
[x, fval] = fmincon(@simulation,x,A,b,Aeq,beq,x1,x2,[],options)
save('param_final_tau5.mat','param')

 %% using Genetic algorithm

% options = optimoptions('ga', 'Display', 'iter', 'PlotFcn', @gaplotbestf, 'MaxGenerations', 500, 'PopulationSize', 50, 'UseParallel', true);
% [x, fval] = ga(@simulation, length(x0), A, b, Aeq, beq, lb, ub, [], options);
% save('param_final_tau5.mat', 'x');