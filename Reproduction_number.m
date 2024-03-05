iter=1;
%for new 60*60grid to find the re
% for i= 1:iter
%     gamma{i}= zeros(120);
% end 
for T= 1:iter
    for i= 1:param.grid
        for j= 1:param.grid
            if j==1
                I_matrix(j,j)=(2*(param.eta_l*(60*60))) + ((1- 4*param.eta_l - param.delta) + (param.e * param.phi * latency{i,j}(T)));
% I_matrix(j,j)= (2*(param.eta_l*(60*60))) + ((- 4*param.eta_l - param.delta));
                I_matrix(j,j+1)= -2*(param.eta_l*(60*60));

                L_matrix(j,j)= (2*(param.eta_Lat*(60*60))) + ((1-4*param.eta_Lat) -param.e * param.phi * latency{i,j}(T));
                L_matrix(j,j+1)=-(param.eta_Lat*(60*60));

            elseif j==param.grid
                I_matrix(j,j)= (2*(param.eta_l*(60*60))) + ((1- 4*param.eta_l - param.delta) + (param.e * param.phi * latency{i,j}(T)));
% I_matrix(j,j)= (2*(param.eta_l*(60*60))) + ((- 4*param.eta_l - param.delta));

                I_matrix(j,j-1)= -2*(param.eta_l*(60*60));

                L_matrix(j,j)=(2*(param.eta_Lat*(60*60))) + ((1-4*param.eta_Lat) - param.e * param.phi * latency{i,j}(T));
                L_matrix(j,j-1)=-(param.eta_Lat*(60*60));

            else
                I_matrix(j,j)= (2*(param.eta_l*(60*60))) + ((1- 4*param.eta_l - param.delta) + (param.e * param.phi * latency{i,j}(T)));
% I_matrix(j,j)= (2*(param.eta_l*(60*60))) + ((- 4*param.eta_l - param.delta));
                I_matrix(j,j-1)= -(param.eta_l*(60*60));
                I_matrix(j,j+1)=-(param.eta_l*(60*60));

                L_matrix(j,j)= (2*(param.eta_Lat*(60*60))) + ((1-4*param.eta_Lat) -param.e * param.phi * latency{i,j}(T));
                L_matrix(j,j-1)=-(param.eta_Lat*(60*60));
                L_matrix(j,j+1)=-(param.eta_Lat*(60*60));
%                 L_matrix(j,j+1)= -(param.eta_Lat*(60*60));
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
%     r_day(T) = max(r_row); % max eigan value for one iteration 
    r_day_new(T) = sum(r_row_new)/param.grid;
    % considering only the rows in boundary
    % r_row(1:11)=0;
    % r_row(49:60)=0;
    r_day(T) = sum(r_row)/param.grid;
    test(T) = sum(r_row)/param.grid;
end

for T=1:45
%     sus_pop(T) = (S_loop_OH(T)/(S_loop_OH(T) + L_loop_OH(T) + I_loop_OH(T) + R_loop_OH(T)));
    sus_pop(T) = (S_loop_OH_complete(T)/Population(T));
end
% 
% % for i
% 
% Re for the remainder timeline
r_day;
R_o= r_day(1)
% r_day(1)= R_o;
for T= 2:Time
%     r_day(T) = R_o * (S_loop_OH(T)/pop_total);
    r_day(T)= R_o * sus_pop(T);
end

for i= 5:60
    inf_avg(i,1) = sum(I_true(i-4:i))/5;
end


%% rough
% 
% for T= 16:60
%     rough1(1,T-15)= r0{20,12}(T);
%     rough2(1,T-15)= r0{25,32}(T);
%     rough3(1,T-15)= r0{35,20}(T);
%     inf1(1,T-15)= I_loop{20,12}(T);
%     inf2(1,T-15)= I_loop{25,32}(T);
%     inf3(1,T-15)= I_loop{35,20}(T);
% end
% 
% % 
% 
% for i= 16:60
%     plot1(i-15,1)= r0{24,31}(i);
%     plot2(i-15,1)= r0{34,32}(i);
%     plot3(i-15,1)= r0{30,20}(i);
%     plot4(i-15,1)= r0{22,34}(i);
% 
%     plo1(i-15,1)= r1{32,20}(i);
%     plo2(i-15,1)= r1{22,42}(i);
%     plo3(i-15,1)= r1{42,21}(i); 
% 
%     play11(i-15,1)= I_loop{24,33}(i);
%     play22(i-15,1)=I_loop{34,32}(i);
%     play33(i-15,1)=I_loop{31,21}(i);
%     play44(i-15,1)=I_loop{22,34}(i);
% 
%     play11_true(i-15,1)= I_loop_true{24,31}(i);
%     play22_true(i-15,1)=I_loop_true{34,32}(i);
%     play33_true(i-15,1)=I_loop_true{31,21}(i);
%     play44_true(i-15,1)=I_loop_true{22,35}(i);
% end
% 
% % for i= 1:60
% %     plot1(i,1)= r0{24,27}(i);
% %     plot2(i,1)= r0{34,32}(i);
% %     plot3(i,1)= r0{30,20}(i);
% %     plot4(i,1)= r0{28,20}(i);
% %     plo1(i,1)= r1{32,20}(i);
% %     plo2(i,1)= r1{22,42}(i);
% %     plo3(i,1)= r1{42,21}(i); 
% %     play11(i,1)= I_loop{24,27}(i);
% %     play22(i,1)=I_loop{34,32}(i);
% %     play33(i,1)=I_loop{30,20}(i);
% %     play44(i,1)=I_loop{28,20}(i);
% % end
%     f1_total= zeros(60,1);
%     f2_total= zeros(60,1);
%     f3_total= zeros(60,1);
%     f_tot= zeros(60,1);
% 
% for T=1:60
%     for j=1:length(first_cells)
%         f1_total(T,1)= f1_total(T,1)+ r0{(first_cells(j,1)) , (first_cells(j,2))}(T);
%     end
% end
% 
% for T=1:60
%     for j=1:length(second_cells)
%         f2_total(T,1)= f2_total(T,1)+ r0{(second_cells(j,1)) , (second_cells(j,2))}(T);
%     end
% end
% 
% for T=1:60
%     for j=1:length(third_cells)
%         f3_total(T,1)= f3_total(T,1)+ r0{(third_cells(j,1)) , (third_cells(j,2))}(T);
%     end
% end
% for T=1:60
%     for i=1:60
%         for j=1:59
%             f_tot(T,1)= f_tot(T,1)+ r0{i,j}(T);
%         end
%     end
% end
% f_tot2=  f_tot/224;