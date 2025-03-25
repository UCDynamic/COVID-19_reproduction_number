iter=1;
Time = T;

for T= 1:Time
    for i= 1:param.grid
        for j= 1:param.grid
            if j==1
                I_matrix(j,j)=(2*(param.eta_l*(60*60))) + ((1- 4*param.eta_l - param.delta) + (param.e * param.phi * latency{i,j}(T)));

                I_matrix(j,j+1)= -2*(param.eta_l*(60*60));
                L_matrix(j,j)= (2*(param.eta_lat*(60*60))) + ((1-4*param.eta_lat) -param.e * param.phi * latency{i,j}(T));
                L_matrix(j,j+1)=-(param.eta_lat*(60*60));

            elseif j==param.grid
                I_matrix(j,j)= (2*(param.eta_l*(60*60))) + ((1- 4*param.eta_l - param.delta) + (param.e * param.phi * latency{i,j}(T)));


                I_matrix(j,j-1)= -2*(param.eta_l*(60*60));

                L_matrix(j,j)=(2*(param.eta_lat*(60*60))) + ((1-4*param.eta_lat) - param.e * param.phi * latency{i,j}(T));
                L_matrix(j,j-1)=-(param.eta_lat*(60*60));

            else
                I_matrix(j,j)= (2*(param.eta_l*(60*60))) + ((1- 4*param.eta_l - param.delta) + (param.e * param.phi * latency{i,j}(T)));

                I_matrix(j,j-1)= -(param.eta_l*(60*60));
                I_matrix(j,j+1)=-(param.eta_l*(60*60));

                L_matrix(j,j)= (2*(param.eta_lat*(60*60))) + ((1-4*param.eta_lat) -param.e * param.phi * latency{i,j}(T));
                L_matrix(j,j-1)=-(param.eta_lat*(60*60));
                L_matrix(j,j+1)=-(param.eta_lat*(60*60));

            end          
        end
        % F matrix
        F= [0,(param.phi/param.N)*(param.lambda/param.theta);0,0;];

        A= [L_matrix zeros(50,50); % A matrix of disease sub-system
                zeros(50,50)  I_matrix];
        A1= inv(A);
        B= eye(50);
        K= kron(F,B);
        gamma= K*A1;
        R_small(i,1) = max(abs(eig(gamma(1:50 , 51:100))));
        % test(i,1) = eigs(gamma);
        opts.tol = 1e-16; % Tolerance for convergence
        opts.maxit = 300; % Maximum number of iterations
        r_row(i,1)= max(real(eigs(gamma, 8, 'largestabs', opts))) ; %max eigan value of a row
        r_row_test= abs(eigs(gamma));
        r_row_new(i,1) = sum(r_row_test)/(param.grid);
    end
    r_day_new(T) = sum(R_small)/param.grid;
    R_small = sum(R_small)/50;
    % r_day_new(T) = sum(R_small)/param.grid;

    r_day(T) = sum(r_row)/param.grid;
    test(T) = sum(r_row)/param.grid;
end

for T=1:45
    sus_pop(T) = (S_loop_OH_static(T)/Pop_loop_OH(T));
end

r_day;
R_small;
R_o= R_small
r_day = R_o;

for T= 2:Time

    r_day(T)= R_o * sus_pop(T);
    r_day_new(T) = r_day_new(T) * sus_pop(T);
end

for i= 5:50
    inf_avg(i,1) = sum(I_true(i-4:i))/5;
end
