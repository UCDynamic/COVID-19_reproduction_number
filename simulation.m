
function [obj]=simulation(param)

load('env')
T=30;
[genome]=chromosome(param)%assign your genome(combination of parameter)

 [S_loop, I_loop, R_loop,L_loop]=solve_loop(env, genome,T,1) ;
%n
for i=1:57
    for j=1:T
S_loop_sum{i}(j)=0;
I_loop_sum{i}(j)=0;
R_loop_sum{i}(j)=0;
L_loop_sum{i}(j)=0;
    end
end

cells=zeros(57,1);

for index=1:57
    for i=1:60
        for j=1:60
            if env(j,i).index==index
                cells(index)=cells(index)+1;
                for T=1:30
                S_loop_sum{index}(T)=S_loop_sum{index}(T)+S_loop{j,i}(T);
                L_loop_sum{index}(T)=L_loop_sum{index}(T)+L_loop{j,i}(T);
                I_loop_sum{index}(T)=I_loop_sum{index}(T)+I_loop{j,i}(T);
                R_loop_sum{index}(T)=R_loop_sum{index}(T)+R_loop{j,i}(T);
                end
            end
        end
    end
end

fitness=fitness_function(T,S_loop_sum,I_loop_sum,R_loop_sum,L_loop_sum, Cases_final);
obj=mean(fitness)

end