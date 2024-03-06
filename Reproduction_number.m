iter=1;
 
for T= 1:iter
    for i= 1:param.grid
        for j= 1:param.grid
            if j==1
                I_matrix(j,j)=(2*(param.eta_l*(60*60))) + ((1- 4*param.eta_l - param.delta) + (param.e * param.phi * latency{i,j}(T)));

                I_matrix(j,j+1)= -2*(param.eta_l*(60*60));

                L_matrix(j,j)= (2*(param.eta_Lat*(60*60))) + ((1-4*param.eta_Lat) -param.e * param.phi * latency{i,j}(T));
                L_matrix(j,j+1)=-(param.eta_Lat*(60*60));

            elseif j==param.grid
                I_matrix(j,j)= (2*(param.eta_l*(60*60))) + ((1- 4*param.eta_l - param.delta) + (param.e * param.phi * latency{i,j}(T)));


                I_matrix(j,j-1)= -2*(param.eta_l*(60*60));

                L_matrix(j,j)=(2*(param.eta_Lat*(60*60))) + ((1-4*param.eta_Lat) - param.e * param.phi * latency{i,j}(T));
                L_matrix(j,j-1)=-(param.eta_Lat*(60*60));

            else
                I_matrix(j,j)= (2*(param.eta_l*(60*60))) + ((1- 4*param.eta_l - param.delta) + (param.e * param.phi * latency{i,j}(T)));

                I_matrix(j,j-1)= -(param.eta_l*(60*60));
                I_matrix(j,j+1)=-(param.eta_l*(60*60));

                L_matrix(j,j)= (2*(param.eta_Lat*(60*60))) + ((1-4*param.eta_Lat) -param.e * param.phi * latency{i,j}(T));
                L_matrix(j,j-1)=-(param.eta_Lat*(60*60));
                L_matrix(j,j+1)=-(param.eta_Lat*(60*60));

            end          
        end
        % F matrix
        F= [0,(param.phi/param.N)*(param.lambda/param.theta);0,0;];

        A= [L_matrix zeros(60,60); % A matrix of disease sub-system
                zeros(60,60)  I_matrix];
        A1= inv(A);
        B= eye(60);
        K= kron(F,B);
        gamma= K*A1;
        % test(i,1) = eigs(gamma);
        opts.tol = 1e-16; % Tolerance for convergence
        opts.maxit = 300; % Maximum number of iterations
        r_row(i,1)= max(real(eigs(gamma, 8, 'largestabs', opts))) ; %max eigan value of a row
        r_row_test= abs(eigs(gamma));
        r_row_new(i,1) = sum(r_row_test)/(param.grid);
    end

    r_day_new(T) = sum(r_row_new)/param.grid;

    r_day(T) = sum(r_row)/param.grid;
    test(T) = sum(r_row)/param.grid;
end

for T=1:45
    sus_pop(T) = (S_loop_OH_complete(T)/Population(T));
end

r_day;
R_o= r_day(1)

for T= 2:Time

    r_day(T)= R_o * sus_pop(T);
end

for i= 5:60
    inf_avg(i,1) = sum(I_true(i-4:i))/5;
end


