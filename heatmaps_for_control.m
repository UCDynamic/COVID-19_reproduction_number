load('env')
load('x')
param=chromosome(x)

Time=45; %time iterations


%ORRIG. Model
  [S_loop, I_loop, R_loop,L_loop]=solve_loop(env, param,Time,1) ;
for i=1:57
    for j=1:Time
S_loop_sum{i}(j)=0;
I_loop_sum{i}(j)=0; 
R_loop_sum{i}(j)=0;
L_loop_sum{i}(j)=0;
% d_n_sum{i}(j)=0; 
% d_B_sum{i}(j)=0;
% B_meu_sum{i}(j)=0;
    end
end
cells=zeros(57,1);
for index=1:57
    for i=1:60
        for j=1:60
            if env(j,i).index==index
                cells(index)=cells(index)+1;
                for T=1:Time
                S_loop_sum{index}(T)=S_loop_sum{index}(T)+S_loop{j,i}(T);
                L_loop_sum{index}(T)=L_loop_sum{index}(T)+L_loop{j,i}(T);
                I_loop_sum{index}(T)=I_loop_sum{index}(T)+I_loop{j,i}(T);
                R_loop_sum{index}(T)=R_loop_sum{index}(T)+R_loop{j,i}(T);
%                 d_n_sum{index}(T)=d_n_sum{index}(T)+d_n{j,i}(T);
%                 d_B_sum{index}(T)=d_B_sum{index}(T)+d_B{j,i}(T);
%                 B_meu_sum{index}(T)=B_meu_sum{index}(T)+B_meu{j,i}(T);
                 end
            end
        end
    end
end

%calculatig for Ohio
for T=1:Time
S_loop_OH(T)=0;
L_loop_OH(T)=0;
I_loop_OH(T)=0;
R_loop_OH(T)=0;
% d_n_OH(T)=0;
% d_B_OH(T)=0;
% B_meu_OH(T)=0;

end

for T=1:Time
for index=1:57
S_loop_OH(T)=S_loop_OH(T)+S_loop_sum{index}(T)+L_loop_sum{index}(T);
I_loop_OH(T)=I_loop_OH(T)+I_loop_sum{index}(T);
R_loop_OH(T)=R_loop_OH(T)+R_loop_sum{index}(T);
% d_n_OH(T)=d_n_OH(T)+ d_n_sum{index}(T);
% d_B_OH(T)=d_B_OH(T)+d_B_sum{index}(T);
% B_meu_OH(T)=B_meu_OH(T)+B_meu_sum{index}(T);

end
Population_orig(T)=S_loop_OH(T)+I_loop_OH(T)+R_loop_OH(T);%-d_n_OH(T)-d_B_OH(T)+B_meu_OH(T);
end



%CASE1. Model
  [S_loop_1, I_loop_1, R_loop_1,L_loop_1]=solve_loop(env, param,Time,2) ;
for i=1:57
    for j=1:Time
S_loop_sum{i}(j)=0;
I_loop_sum{i}(j)=0; 
R_loop_sum{i}(j)=0;
L_loop_sum{i}(j)=0;
% d_n_sum{i}(j)=0; 
% d_B_sum{i}(j)=0;
% B_meu_sum{i}(j)=0;
    end
end
cells=zeros(57,1);
for index=1:57
    for i=1:60
        for j=1:60
            if env(j,i).index==index
                cells(index)=cells(index)+1;
                for T=1:Time
                S_loop_sum{index}(T)=S_loop_sum{index}(T)+S_loop_1{j,i}(T);
                L_loop_sum{index}(T)=L_loop_sum{index}(T)+L_loop_1{j,i}(T);
                I_loop_sum{index}(T)=I_loop_sum{index}(T)+I_loop_1{j,i}(T);
                R_loop_sum{index}(T)=R_loop_sum{index}(T)+R_loop_1{j,i}(T);
%                 d_n_sum{index}(T)=d_n_sum{index}(T)+d_n{j,i}(T);
%                 d_B_sum{index}(T)=d_B_sum{index}(T)+d_B{j,i}(T);
%                 B_meu_sum{index}(T)=B_meu_sum{index}(T)+B_meu{j,i}(T);
                 end
            end
        end
    end
end

%calculatig for Ohio
for T=1:Time
S_loop_OH_1(T)=0;
L_loop_OH_1(T)=0;
I_loop_OH_1(T)=0;
R_loop_OH_1(T)=0;
% d_n_OH(T)=0;
% d_B_OH(T)=0;
% B_meu_OH(T)=0;

end

for T=1:Time
for index=1:57
S_loop_OH_1(T)=S_loop_OH_1(T)+S_loop_sum{index}(T)+L_loop_sum{index}(T);
I_loop_OH_1(T)=I_loop_OH_1(T)+I_loop_sum{index}(T);
R_loop_OH_1(T)=R_loop_OH_1(T)+R_loop_sum{index}(T);
% d_n_OH(T)=d_n_OH(T)+ d_n_sum{index}(T);
% d_B_OH(T)=d_B_OH(T)+d_B_sum{index}(T);
% B_meu_OH(T)=B_meu_OH(T)+B_meu_sum{index}(T);

end
Population_orig(T)=S_loop_OH(T)+I_loop_OH(T)+R_loop_OH(T);%-d_n_OH(T)-d_B_OH(T)+B_meu_OH(T);
end



%Case2. Model
  [S_loop_2, I_loop_2, R_loop_2,L_loop_2]=solve_loop(env, param,Time,3) ;
for i=1:57
    for j=1:Time
S_loop_sum{i}(j)=0;
I_loop_sum{i}(j)=0; 
R_loop_sum{i}(j)=0;
L_loop_sum{i}(j)=0;
% d_n_sum{i}(j)=0; 
% d_B_sum{i}(j)=0;
% B_meu_sum{i}(j)=0;
    end
end
cells=zeros(57,1);
for index=1:57
    for i=1:60
        for j=1:60
            if env(j,i).index==index
                cells(index)=cells(index)+1;
                for T=1:Time
                S_loop_sum{index}(T)=S_loop_sum{index}(T)+S_loop_2{j,i}(T);
                L_loop_sum{index}(T)=L_loop_sum{index}(T)+L_loop_2{j,i}(T);
                I_loop_sum{index}(T)=I_loop_sum{index}(T)+I_loop_2{j,i}(T);
                R_loop_sum{index}(T)=R_loop_sum{index}(T)+R_loop_2{j,i}(T);
%                 d_n_sum{index}(T)=d_n_sum{index}(T)+d_n{j,i}(T);
%                 d_B_sum{index}(T)=d_B_sum{index}(T)+d_B{j,i}(T);
%                 B_meu_sum{index}(T)=B_meu_sum{index}(T)+B_meu{j,i}(T);
                 end
            end
        end
    end
end

%calculatig for Ohio
for T=1:Time
S_loop_OH_2(T)=0;
L_loop_OH_2(T)=0;
I_loop_OH_2(T)=0;
R_loop_OH_2(T)=0;
% d_n_OH(T)=0;
% d_B_OH(T)=0;
% B_meu_OH(T)=0;

end

for T=1:Time
for index=1:57
S_loop_OH_2(T)=S_loop_OH_2(T)+S_loop_sum{index}(T)+L_loop_sum{index}(T);
I_loop_OH_2(T)=I_loop_OH_2(T)+I_loop_sum{index}(T);
R_loop_OH_2(T)=R_loop_OH_2(T)+R_loop_sum{index}(T);
% d_n_OH(T)=d_n_OH(T)+ d_n_sum{index}(T);
% d_B_OH(T)=d_B_OH(T)+d_B_sum{index}(T);
% B_meu_OH(T)=B_meu_OH(T)+B_meu_sum{index}(T);

end
Population_orig(T)=S_loop_OH(T)+I_loop_OH(T)+R_loop_OH(T);%-d_n_OH(T)-d_B_OH(T)+B_meu_OH(T);
end


%TRUE DATA
S_sum=zeros(81,1);
I_sum=zeros(81,1);
R_sum=zeros(81,1);
R_our_sum=zeros(81,1);

for i=10:90
for j=1:57
    if j~=20
   S_sum(i-9)=S_sum(i-9)+Cases_final{j}(i,6);
   I_sum(i-9)=I_sum(i-9)+Cases_final{j}(i,5);
   R_our_sum(i-9)=R_our_sum(i-9)+Cases_final{j}(i,9);
    end
end
end
  figure(3)
  
  grid on
  subplot(3,1,1)
  plot((1:45),S_loop_OH(1:45), 'LineWidth',3)
  hold on
  plot((1:45),S_loop_OH_1(1:45), 'LineWidth',3)
  hold on
  plot((1:45),S_loop_OH_2(1:45), 'LineWidth',3)
  hold on
  title('Susceptible Population (S) vs Time','FontSize',20)
  xlabel('Time/Days','fontweight','bold','FontSize',20)
  ylabel('Population','fontweight','bold','FontSize',20)
  a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
%    legend('No control measures','Case 1','Case 2')
    grid on
ax = gca;
ax.GridColor = [0 .5 .5];
ax.GridLineStyle = '--';
ax.GridAlpha = 0.5;
  subplot(3,1,2)             
  plot((1:45),I_loop_OH(1:45), 'LineWidth',3)
  hold on
  plot((1:45),I_loop_OH_1(1:45), 'LineWidth',3)
  hold on
  plot((1:45),I_loop_OH_2(1:45), 'LineWidth',3)
  hold on
    title('Infectious Population (I) vs Time','FontSize',20)
  xlabel('Time/Days','fontweight','bold','FontSize',20)
  ylabel('Population','fontweight','bold','FontSize',20)
  a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
%    legend('No control measures','Case 1','Case 2')
    grid on
ax = gca;
ax.GridColor = [0 .5 .5];
ax.GridLineStyle = '--';
ax.GridAlpha = 0.5;
  subplot(3,1,3)
  plot((1:45),R_loop_OH(1:45), 'LineWidth',3)
  hold on
  plot((1:45),R_loop_OH_1(1:45), 'LineWidth',3)
  hold on
  plot((1:45),R_loop_OH_2(1:45), 'LineWidth',3)
  hold on
  title('Recovered Population (R) vs Time','FontSize',20)
  xlabel('Time/Days','fontweight','bold','FontSize',20)
  ylabel('Population','fontweight','bold','FontSize',20)

  legend('WO control','Model Control Case 1','Control Case 2')
  a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
    grid on
ax = gca;
ax.GridColor = [0 .5 .5];
ax.GridLineStyle = '--';
ax.GridAlpha = 0.5;
  
  
   for n=1:3
%        S=zeros(50,50);
I=zeros(50,50);
% R=zeros(50,50);
    for i=1:50
       for j=1:50 
%         S(j,i)=S_loop{j,i}((n)*15);
        I(j,i)=I_loop_2{j,i}((n)*15);
%         R(j,i)=R_loop{j,i}((n)*15);  
       end
    end
%     figure(1)
%     heatmap(S)
%     title('S map T=15 no control input')
    
    subplot(2,2,n)
     h= heatmap(I)
   YLabels = 1:50;
   
XLabels = 1:50;
% Convert each number in the array into a string
CustomYLabels = string(XLabels);
% Replace all but the fifth elements by spaces
CustomYLabels(mod(XLabels,5) ~= 0) = " ";
% Set the 'XDisplayLabels' property of the heatmap 
% object 'h' to the custom x-axis tick labels
h.YDisplayLabels = CustomYLabels;
% Convert each number in the array into a string
CustomXLabels = string(XLabels);
% Replace all but the fifth elements by spaces
CustomXLabels(mod(XLabels,5) ~= 0) = " ";
% Set the 'XDisplayLabels' property of the heatmap 
% object 'h' to the custom x-axis tick labels
h.XDisplayLabels = CustomXLabels;
      caxis([0, 20]);
      colormap(jet(256));


     title('Infectious Population @ Day '+string(n* 15)+' - No Control Inputs Model Results')
%   a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'FontName','Times','fontsize',6)
%     figure(3)
%     heatmap(R)
%     title('R map T=15 no control input')
   end
   
%    
%    for i=1:50
%        for j=1:50
%       I_loop_1{j,i}(15)=abs(I_loop_1{j,i}(15));
%        
%        end
%    end
%    
%     for n=1:1
% % S=zeros(50,50);
% I=zeros(50,50);
% % R=zeros(50,50);
%     for i=1:50
%        for j=1:50 
% %         S(j,i)=S_loop_1{j,i}((n)*15);
%         I(j,i)=I_loop_1{j,i}((n)*15);
% %         R(j,i)=R_loop_1{j,i}((n*15));  
%        end
%     end
% %     figure(4)
% %     heatmap(S)
% %     title('S map T=15 Case1')
%     
%     figure(2)
%      h= heatmap(I)
%    YLabels = 1:50;
% % Convert each number in the array into a string
% CustomYLabels = string(XLabels);
% % Replace all but the fifth elements by spaces
% CustomYLabels(mod(XLabels,5) ~= 0) = " ";
% % Set the 'XDisplayLabels' property of the heatmap 
% % object 'h' to the custom x-axis tick labels
% h.YDisplayLabels = CustomYLabels;
% XLabels = 1:50;
% % Convert each number in the array into a string
% CustomXLabels = string(XLabels);
% % Replace all but the fifth elements by spaces
% CustomXLabels(mod(XLabels,5) ~= 0) = " ";
% % Set the 'XDisplayLabels' property of the heatmap 
% % object 'h' to the custom x-axis tick labels
% h.XDisplayLabels = CustomXLabels;
%       caxis([0, 450]);
%       colormap(jet(256));
%     title('Infectious Population @ Day 15 - Case 1 Model Results')
% %     figure(6)
% %     heatmap(R)
% %     title('R map T=15 Case1')
%     end
%     
%        for i=1:50
%        for j=1:50
%       I_loop_2{j,i}(15)=abs(I_loop_2{j,i}(15));
%        
%        end
%    end
%        for n=1:1
% % S=zeros(50,50);
% I=zeros(50,50);
% % R=zeros(50,50);
%     for i=1:50
%        for j=1:50 
% %         S(j,i)=S_loop_2{j,i}((n)*15);
%         I(j,i)=I_loop_2{j,i}((n)*15);
% %         R(j,i)=R_loop_2{j,i}((n*15));  
%        end
%     end
% %     figure(7)
% %     heatmap(S)
% %     title('S map T=15 Case2')
%     figure(3)
%     
%    h= heatmap(I)
%    YLabels = 1:50;
% % Convert each number in the array into a string
% CustomYLabels = string(XLabels);
% % Replace all but the fifth elements by spaces
% CustomYLabels(mod(XLabels,5) ~= 0) = " ";
% % Set the 'XDisplayLabels' property of the heatmap 
% % object 'h' to the custom x-axis tick labels
% h.YDisplayLabels = CustomYLabels;
% XLabels = 1:50;
% % Convert each number in the array into a string
% CustomXLabels = string(XLabels);
% % Replace all but the fifth elements by spaces
% CustomXLabels(mod(XLabels,5) ~= 0) = " ";
% % Set the 'XDisplayLabels' property of the heatmap 
% % object 'h' to the custom x-axis tick labels
% h.XDisplayLabels = CustomXLabels;
%       caxis([0, 450]);
%       colormap(jet(256));
%     title('Infectious Population @ Day 15 - Case 2 Model Results')
% %     figure(9)
% %     heatmap(R)
% %     title('R map T=15 Case2')
%        end
%     
%         figure(4)
% 
%         h= heatmap(env_true_15_I)
%    YLabels = 1:50;
% % Convert each number in the array into a string
% CustomYLabels = string(XLabels);
% % Replace all but the fifth elements by spaces
% CustomYLabels(mod(XLabels,5) ~= 0) = " ";
% % Set the 'XDisplayLabels' property of the heatmap 
% % object 'h' to the custom x-axis tick labels
% h.YDisplayLabels = CustomYLabels;
% XLabels = 1:50;
% % Convert each number in the array into a string
% CustomXLabels = string(XLabels);
% % Replace all but the fifth elements by spaces
% CustomXLabels(mod(XLabels,5) ~= 0) = " ";
% % Set the 'XDisplayLabels' property of the heatmap 
% % object 'h' to the custom x-axis tick labels
% h.XDisplayLabels = CustomXLabels;
%       caxis([0, 450]);
%       colormap(jet(256));
%     title('Infectious Population @ Day 15 - True data')



