        function [fitness]=fitness_function(T,S_loop_sum,I_loop_sum,R_loop_sum,L_loop_sum, Cases_Table)
        Serr=0;
        Ierr=0;
        Rerr=0;
        Lerr=0;
        for i=1:57
                  Serr=Serr+ immse(Cases_Table{i}(10:T+9,6),(S_loop_sum{i}(1:T)))%+L_loop_sum{i}(1:T))');
                  Ierr=Ierr+ immse(Cases_Table{i}(10:T+9,5),I_loop_sum{i}(1:T)');
                  Rerr=Rerr+ immse(Cases_Table{i}(10:T+9,9),R_loop_sum{i}(1:T)');
        end             
        fitness=[Serr Ierr Rerr];
        end