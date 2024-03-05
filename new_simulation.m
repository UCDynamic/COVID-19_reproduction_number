       load('x')
%            param=chromosome(x)
for i=1:10
    for j=1:10
          
       if i==1||i==10||j==1||j==10
           env(j,i).in_map=0
           env(j,i).boundry=0
           env(j,i).S=0
           env(j,i).I=0
           env(j,i).R=0
       elseif i==2||i==9||j==2||j==9
           env(j,i).in_map=1
           env(j,i).boundry=1
           env(j,i).S=randi([0 10],1,1)
           env(j,i).I=randi([0 2],1,1)
           env(j,i).R=0
       else
           env(j,i).in_map=1
           env(j,i).boundry=0
           env(j,i).S=randi([0 10],1,1)
           env(j,i).I=randi([0 2],1,1)
           env(j,i).R=0
       end
    end
end


Time=30; %time iterations

ca=1;
  [S_loop, I_loop, R_loop,L_loop,d_n,d_B,B_meu]=solve_loop(env, param,Time,ca) ;

%calculatig for Ohio
for T=1:Time
S_loop_OH(T)=0;
L_loop_OH(T)=0;
I_loop_OH(T)=0;
R_loop_OH(T)=0;
d_n_OH(T)=0;
d_B_OH(T)=0;
B_meu_OH(T)=0;

end

for T=1:Time
for j=1:10
    for i=1:10
S_loop_OH(T)=S_loop_OH(T)+S_loop{i,j}(T);%+L_loop_sum{index}(T);
I_loop_OH(T)=I_loop_OH(T)+I_loop{i,j}(T);
R_loop_OH(T)=R_loop_OH(T)+R_loop{i,j}(T);
d_n_OH(T)=d_n_OH(T)+ d_n{i,j}(T);
d_B_OH(T)=d_B_OH(T)+d_B{i,j}(T);
B_meu_OH(T)=B_meu_OH(T)+B_meu{i,j}(T);

    end
end
Population(T)=S_loop_OH(T)+I_loop_OH(T)+R_loop_OH(T)+d_n_OH(T)+d_B_OH(T)-B_meu_OH(T);
end
