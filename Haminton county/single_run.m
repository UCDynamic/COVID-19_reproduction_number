
%% First Timeframe (TF-1)
% load('env.mat')
% load('param_first_tau5.mat')
% Timeframe=1;

%% Second Timeframe (TF-2)
load('env_mid.mat')
load('param_mid_tau5.mat')
Timeframe=2;

%% Third Timeframe (TF-3)
% load('env_final.mat')
% load('param_final_tau5.mat')
% Timeframe=3;

%% Normal Case 1
Time=45; %time iterationsfirst

ca=1;
  [S_loop, I_loop, R_loop,L_loop, latency]=solve_loop(env, param,Time,ca) ;
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

%% calculate the total population
pop_total=0;
for index = 1:57
    pop_total= pop_total + Cases_final{index}(1,6);
end



%% 
cells=zeros(57,1);
for index=1:57
    for i=1:param.grid
        for j=1:param.grid
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
S_loop_OH_complete(T)=0;
% d_n_OH(T)=0;
% d_B_OH(T)=0;
% B_meu_OH(T)=0;
end
for T=1:Time
for index=1:57
S_loop_OH(T)=S_loop_OH(T)+S_loop_sum{index}(T)+L_loop_sum{index}(T);
S_loop_OH_complete(T)=S_loop_OH_complete(T)+S_loop_sum{index}(T);
I_loop_OH(T)=I_loop_OH(T)+I_loop_sum{index}(T);
R_loop_OH(T)=R_loop_OH(T)+R_loop_sum{index}(T);
% d_n_OH(T)=d_n_OH(T)+ d_n_sum{index}(T);
% d_B_OH(T)=d_B_OH(T)+d_B_sum{index}(T);
% B_meu_OH(T)=B_meu_OH(T)+B_meu_sum{index}(T);
end
Population(T)=S_loop_OH(T)+I_loop_OH(T)+R_loop_OH(T);%-d_n_OH(T)-d_B_OH(T)+B_meu_OH(T);
end

S_sum=zeros(45+30,1);
I_sum=zeros(45+30,1);
R_sum=zeros(45+30,1);
R_our_sum=zeros(45+30,1);
I_true=zeros(75,1);

for i=10:45+30
for j=1:57
    if j~=20
       S_sum(i-9)=S_sum(i-9)+abs(Cases_final{j}(i,6));
       I_sum(i-9)=I_sum(i-9)+abs(Cases_final{j}(i,5));
       R_our_sum(i-9)=R_our_sum(i-9)+abs(Cases_final{j}(i,9));
       I_true(i-9) = I_true(i-9)+abs(Cases_final{j}(i,2));
    end
end
end

%Making I_loop for true data 
for i=1:param.grid
    for j=1:param.grid
        Mat_idx(j,i)=env(j,i).index;
    end
end
for i=1:57
        i
        row=[]
        col=[]
        IDX=i; %county index of interest
        
         [row, col]=find(Mat_idx==IDX); %find row and column numbers of the environment with that county
         t_cells(i)=length(row); %total number of cells
        
end
% 
% for i =1:param.grid
%     for j=1:param.grid
% 
% I_loop_true{j,i}=zeros(Time,1);
% 
% 
% if (env(j,i).in_map==1 && env(j,i).boundry==0)
%   Idx= env(j,i).index;
%   if Idx~=20
%     I_loop_true{j,i}(:)=(Cases_final{1,Idx}(10:Time+9,5)/t_cells(Idx));
%   end
% end
% 
%     end
% end

c1=1;
c2=1;
c3=1;
c4=1;
wall=1;
bound=1;
% for i= 1:param.grid
%     for j= 1:param.grid
%         if isempty(env(i,j).county)~= 1
%             wall=wall+1;
%         end
%         if env(i,j).county== 45246
%             first_cells(c1,1)=i;
%             first_cells(c1,2)=j;
%             c1=c1+1;
%             if env(i,j).boundry== 1
%                 bound=bound+1;
%             end
%         elseif env(i,j).county== 45231
%             second_cells(c2,1)=i;
%             second_cells(c2,2)=j;
%             c2=c2+1;
%         elseif env(i,j).county== 45247
%             third_cells(c3,1)=i;
%             third_cells(c3,2)=j;
%             c3=c3+1;
%         elseif env(i,j).county== 45246
%             fourth_cells(c4,1)=i;
%             fourth_cells(c4,2)=j;
%             c4=c4+1;
%         end
%     end
% end
for i= 2:Time
    I_daily_model(i-1)= (I_loop_OH(i)- I_loop_OH(i-1));
%     I_daily_true(i-1)= I_sum
end

I_daily_test=zeros(Time,1);
for index=1:Time
    for i= 1:57
        I_daily_test(index)= I_daily_test(index) + abs(I_loop_sum{i}(index));
%         I_daily_test
    end
end

I_sum_test= zeros(Time,1);
I_sum_yest= zeros(Time,2);
for i=11:Time+9
    for index=1:57
        I_sum_test(i-10,1)= abs(I_sum_test(i-10,1)+((I_loop_sum{index}(i-9) - I_loop_sum{index}(i-10) + Cases_final{index}(i-1,8) + Cases_final{index}(i-1,3))));
%         I_um=I_sum_test(i-10,1)
%         I_loop= I_loop_sum{index}(i-9)
%         I_loop_prev= I_loop_sum{index}(i-9) - I_loop_sum{index}(i-10)
%         deaths = Cases_final{index}(i-1,8) , Cases_final{index}(i,8)
%         I_sum_yest(i-10,1)= I_sum_yest(i-10,1) + I_loop_sum{index}(i-10);
%         I_sum_yest(i-10,2)= I_sum_yest(i-10,1) + (I_loop_sum{index}(i-9) - I_loop_sum{index}(i-10));
    end
end

%Plotting figures
if Timeframe==3
figure(1)
  subplot(3,1,1)
  plot((1:30),S_loop_OH(1:30), 'LineWidth',3)
  hold on
  plot((30:Time),S_loop_OH(30:Time), 'LineWidth',3, 'LineStyle','--')
  hold on
  plot((1:Time),S_sum(1:Time), 'LineWidth',3)
  hold on  
  title('Susceptible Population (S) vs Time','FontSize',35)
  xlabel('Time/Days','fontweight','bold','FontSize',35)
  ylabel('Population','fontweight','bold','FontSize',35)
  % ylim([S_sum(1,1)-12000 S_sum(45,1)+12000])
  a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
%    legend('No control measures','Case 1','Case 2')
ylim([870000, 890000]);
    grid on
ax = gca;
ax.GridColor = [0 .5 .5];
ax.GridLineStyle = '--';
ax.GridAlpha = 0.5;
% axis([0 45 977000 985000])
  subplot(3,1,2)             
  plot((1:30),I_loop_OH(1:30), 'LineWidth',3)
  hold on
  plot((30:Time),I_loop_OH(30:Time), 'LineWidth',3, 'LineStyle','--')
  hold on
  
  plot((1:Time),I_sum(1:Time), 'LineWidth',3)
  hold on
    title('Infected Population (I) vs Time','FontSize',35)
  xlabel('Time/Days','fontweight','bold','FontSize',35)
  ylabel('Population','fontweight','bold','FontSize',35)
  a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
%    legend('No control measures','Case 1','Case 2')
grid on
ax = gca;
ax.GridColor = [0 .5 .5];
ax.GridLineStyle = '--';
ax.GridAlpha = 0.5;
  subplot(3,1,3)
  plot((1:30),R_loop_OH(1:30), 'LineWidth',3)
  hold on
  plot((30:Time),R_loop_OH(30:Time), 'LineWidth',3, 'LineStyle','--')
  hold on
%  
  plot((1:Time),R_our_sum(1:Time), 'LineWidth',3)
  hold on
  title('Recovered Population (R) vs Time','FontSize',35)
  xlabel('Time/Days','fontweight','bold','FontSize',35)
  ylabel('Population','fontweight','bold','FontSize',35)
  a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
    grid on
ax = gca;
ax.GridColor = [0 .5 .5];
ax.GridLineStyle = '--';
ax.GridAlpha = 0.5;
legend('Model Training','Model Prediction','True data','fontsize',18, 'FontWeight', 'bold')

sgt=sgtitle('Timeframe-2');
sgt.FontWeight= 'bold';
sgt.FontSize = 25;
elseif Timeframe==1
figure(1)
  subplot(3,1,1)
  plot((1:30),S_loop_OH(1:30), 'LineWidth',3)
  hold on
  plot((30:Time),S_loop_OH(30:Time), 'LineWidth',3, 'LineStyle','--')
  hold on
  plot((1:Time),S_sum(1:Time), 'LineWidth',3)
  hold on  
  title('Susceptible Population (S) vs Time','FontSize',35)
  xlabel('Time/Days','fontweight','bold','FontSize',35)
  ylabel('Population','fontweight','bold','FontSize',35)
  % ylim([S_sum(1,1)-12000 S_sum(45,1)+12000])
  a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
%    legend('No control measures','Case 1','Case 2')
ylim([977000, 983500]);
    grid on
ax = gca;
ax.GridColor = [0 .5 .5];
ax.GridLineStyle = '--';
ax.GridAlpha = 0.5;
% axis([0 45 977000 985000])
  subplot(3,1,2)             
  plot((1:30),I_loop_OH(1:30), 'LineWidth',3)
  hold on
  plot((30:Time),I_loop_OH(30:Time), 'LineWidth',3, 'LineStyle','--')
  hold on
  
  plot((1:Time),I_sum(1:Time), 'LineWidth',3)
  hold on
    title('Infected Population (I) vs Time','FontSize',35)
  xlabel('Time/Days','fontweight','bold','FontSize',35)
  ylabel('Population','fontweight','bold','FontSize',35)
  a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
%    legend('No control measures','Case 1','Case 2')
grid on
ax = gca;
ax.GridColor = [0 .5 .5];
ax.GridLineStyle = '--';
ax.GridAlpha = 0.5;
  subplot(3,1,3)
  plot((1:30),R_loop_OH(1:30), 'LineWidth',3)
  hold on
  plot((30:Time),R_loop_OH(30:Time), 'LineWidth',3, 'LineStyle','--')
  hold on
%  
  plot((1:Time),R_our_sum(1:Time), 'LineWidth',3)
  hold on
  title('Recovered Population (R) vs Time','FontSize',35)
  xlabel('Time/Days','fontweight','bold','FontSize',35)
  ylabel('Population','fontweight','bold','FontSize',35)
  a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
    grid on
ax = gca;
ax.GridColor = [0 .5 .5];
ax.GridLineStyle = '--';
ax.GridAlpha = 0.5;
legend('Model Training','Model Prediction','True data','fontsize',18, 'FontWeight', 'bold')

sgt=sgtitle('Timeframe-2');
sgt.FontWeight= 'bold';
sgt.FontSize = 25;

else
figure(1)
  subplot(3,1,1)
  plot((1:30),S_loop_OH(1:30), 'LineWidth',3)
  hold on
  plot((30:Time),S_loop_OH(30:Time), 'LineWidth',3, 'LineStyle','--')
  hold on
  plot((1:Time),S_sum(1:Time), 'LineWidth',3)
  hold on  
  title('Susceptible Population (S) vs Time','FontSize',35)
  xlabel('Time/Days','fontweight','bold','FontSize',35)
  ylabel('Population','fontweight','bold','FontSize',35)
  % ylim([S_sum(1,1)-12000 S_sum(45,1)+12000])
  a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
%    legend('No control measures','Case 1','Case 2')
    grid on
ax = gca;
ax.GridColor = [0 .5 .5];
ax.GridLineStyle = '--';
ax.GridAlpha = 0.5;
% axis([0 45 977000 985000])
  subplot(3,1,2)             
  plot((1:30),I_loop_OH(1:30), 'LineWidth',3)
  hold on
  plot((30:Time),I_loop_OH(30:Time), 'LineWidth',3, 'LineStyle','--')
  hold on
  
  plot((1:Time),I_sum(1:Time), 'LineWidth',3)
  hold on
    title('Infected Population (I) vs Time','FontSize',35)
  xlabel('Time/Days','fontweight','bold','FontSize',35)
  ylabel('Population','fontweight','bold','FontSize',35)
  a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
%    legend('No control measures','Case 1','Case 2')
    grid on
ax = gca;
ax.GridColor = [0 .5 .5];
ax.GridLineStyle = '--';
ax.GridAlpha = 0.5;
  subplot(3,1,3)
  plot((1:30),R_loop_OH(1:30), 'LineWidth',3)
  hold on
  plot((30:Time),R_loop_OH(30:Time), 'LineWidth',3, 'LineStyle','--')
  hold on
%  
  plot((1:Time),R_our_sum(1:Time), 'LineWidth',3)
  hold on
  title('Recovered Population (R) vs Time','FontSize',35)
  xlabel('Time/Days','fontweight','bold','FontSize',35)
  ylabel('Population','fontweight','bold','FontSize',35)
  a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
    grid on
ax = gca;
ax.GridColor = [0 .5 .5];
ax.GridLineStyle = '--';
ax.GridAlpha = 0.5;
legend('Model Training','Model Prediction','True data','fontsize',18, 'FontWeight', 'bold')

sgt=sgtitle('Timeframe-2');
sgt.FontWeight= 'bold';
sgt.FontSize = 25;
end
% figure(1)
% % plot((1:30),I_sum_test(2:31), 'LineWidth',3)
% %   hold on
% %   plot((31:Time-1),I_sum_test(32:Time), 'LineWidth',3, 'LineStyle','--')
% %   hold on
% %   plot((1:59),I_true(2:60), 'LineWidth',3)
% %   hold on
% %     title('Daily Infections (I) vs Time - second timeline','FontSize',35)
% %   xlabel('Time/Days','fontweight','bold','FontSize',35)
% %   ylabel('Population','fontweight','bold','FontSize',35)
% %   a = get(gca,'XTickLabel');
% % set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
% % %    legend('No control measures','Case 1','Case 2')
% %     grid on
% % ax = gca;
% % ax.GridColor = [0 .5 .5];
% % ax.GridLineStyle = '--';
% % ax.GridAlpha = 0.5;
%   subplot(3,1,1)
%   plot((1:30),S_loop_OH(1:30), 'LineWidth',3)
%   hold on
%   plot((30:Time),S_loop_OH(30:Time), 'LineWidth',3, 'LineStyle','--')
%   hold on
%   plot((1:Time),S_sum(1:Time), 'LineWidth',3)
%   hold on  
%   title('Susceptible Population (S) vs Time','FontSize',35)
%   xlabel('Time/Days','fontweight','bold','FontSize',35)
%   ylabel('Population','fontweight','bold','FontSize',35)
%   % ylim([S_sum(1,1)-12000 S_sum(45,1)+12000])
%   a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
% %    legend('No control measures','Case 1','Case 2')
%     grid on
% ax = gca;
% ax.GridColor = [0 .5 .5];
% ax.GridLineStyle = '--';
% ax.GridAlpha = 0.5;
% % axis([0 45 977000 985000])
%   subplot(3,1,2)             
%   plot((1:30),I_loop_OH(1:30), 'LineWidth',3)
%   hold on
%   plot((30:Time),I_loop_OH(30:Time), 'LineWidth',3, 'LineStyle','--')
%   hold on
% 
%   plot((1:Time),I_sum(1:Time), 'LineWidth',3)
%   hold on
%     title('Infected Population (I) vs Time','FontSize',35)
%   xlabel('Time/Days','fontweight','bold','FontSize',35)
%   ylabel('Population','fontweight','bold','FontSize',35)
%   a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
% %    legend('No control measures','Case 1','Case 2')
%     grid on
% ax = gca;
% ax.GridColor = [0 .5 .5];
% ax.GridLineStyle = '--';
% ax.GridAlpha = 0.5;
%   subplot(3,1,3)
%   plot((1:30),R_loop_OH(1:30), 'LineWidth',3)
%   hold on
%   plot((30:Time),R_loop_OH(30:Time), 'LineWidth',3, 'LineStyle','--')
%   hold on
% %  
%   plot((1:Time),R_our_sum(1:Time), 'LineWidth',3)
%   hold on
%   title('Recovered Population (R) vs Time','FontSize',35)
%   xlabel('Time/Days','fontweight','bold','FontSize',35)
%   ylabel('Population','fontweight','bold','FontSize',35)
%   a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
%     grid on
% ax = gca;
% ax.GridColor = [0 .5 .5];
% ax.GridLineStyle = '--';
% ax.GridAlpha = 0.5;
% legend('Model Training','Model Prediction','True data','fontsize',18, 'FontWeight', 'bold')
% 
% sgt=sgtitle('Timeframe-2');
% sgt.FontWeight= 'bold';
% sgt.FontSize = 25;
% 
% % fitness=fitness_function_global(45,S_loop_OH,I_loop_OH,R_loop_OH, S_sum, I_sum, R_our_sum);  
%   
%   
% % %   
% % 
% % %    plot((1:30),R_loop_OH(1:30), 'LineWidth',3)
% % %   hold on
% %      plot((30:60),R_loop_OH(30:60), 'LineWidth',3)
% % %   hold on
% % %    legend('No control measures','Case 1')
% % 
% % 
% % 
% % 
% %    for i=1:50
% %        for j=1:50
% %       I_loop{j,i}(60)=abs(I_loop{j,i}(15));
% %        
% %        end
% %    end
% % % %    
% % load('4.mat')
% % 
% %Heatmaps for simulation results
% I{1}=zeros(50,50);
% I{2}=zeros(50,50);
% I{3}=zeros(50,50);
% I{4}=zeros(50,50);
%     for i=1:50
%        for j=1:50 
%         I{1}(j,i)=I_loop{j,i}(1);
%         I{2}(j,i)=I_loop{j,i}(20);
%         I{3}(j,i)=I_loop{j,i}(40);
%         I{4}(j,i)=I_loop{j,i}(60);
%        end
%     end
% % %     figure(1)
% % %     heatmap(S)
% % %     title('S map T=15 no control input')
% %     
% for i=1:4
%     figure(i+5)
%      h= heatmap(I{i})
%    YLabels = 1:50;
%    XLabels = 1:50;
% % Convert each number in the array into a string
% CustomYLabels = string(XLabels);
% % Replace all but the fifth elements by spaces
% CustomYLabels(mod(XLabels,5) ~= 0) = " ";
% % Set the 'XDisplayLabels' property of the heatmap 
% % object 'h' to the custom x-axis tick labels
% h.YDisplayLabels = CustomYLabels;
% 
% % Convert each number in the array into a string
% CustomXLabels = string(XLabels);
% % Replace all but the fifth elements by spaces
% CustomXLabels(mod(XLabels,5) ~= 0) = " ";
% % Set the 'XDisplayLabels' property of the heatmap 
% % object 'h' to the custom x-axis tick labels
% h.XDisplayLabels = CustomXLabels;
%       caxis([0, 30]);
%       colormap(jet(256));
% 
% % 
%      title(sprintf('Infectious Population @ Day %d - Case 4 Model Results',(i-1)*20))
%      saveas(figure(i+5),sprintf('Infectious Population @ Day %d - Case 4 Model Results.jpg',(i-1)*20))
% end
% 
% %Heatmaps for true data
% for i=1:60
%        for j=1:60 
%         I{1}(j,i)=I_loop_true{j,i}(1);
% %         R0{1}(j,i)=r0{j,i}(17);
%         I{2}(j,i)=I_loop_true{j,i}(20);
%         R0{1}(j,i)=r0{j,i}(30);
%         I{3}(j,i)=I_loop_true{j,i}(40);
% %         R0{3}(j,i)=r0{j,i}(40);
%         I{4}(j,i)=I_loop_true{j,i}(60);
%         R0{2}(j,i)=r0{j,i}(60);
%        end
%     end
% % %     figure(1)
% % %     heatmap(S)
% % %     title('S map T=15 no control input')
% %     
% for i=1:2
%     figure(i+5)
%      h= heatmap(R0{i})
%    YLabels = 1:60;
%    XLabels = 1:60;
% % Convert each number in the array into a string
% CustomYLabels = string(XLabels);
% % % Replace all but the fifth elements by spaces
% % CustomYLabels(mod(XLabels,5) ~= 0) = " ";
% % % Set the 'XDisplayLabels' property of the heatmap 
% % % object 'h' to the custom x-axis tick labels
% % h.YDisplayLabels = CustomYLabels;
% % 
% % % Convert each number in the array into a string
% % CustomXLabels = string(XLabels);
% % % Replace all but the fifth elements by spaces
% % CustomXLabels(mod(XLabels,5) ~= 0) = " ";
% % % Set the 'XDisplayLabels' property of the heatmap 
% % % object 'h' to the custom x-axis tick labels
% h.XDisplayLabels = CustomXLabels;
% %       caxis([0.000001, 2]);
%       colormap(jet(256));
% 
% % 
%      title(sprintf('Predicted Re in Hamilton County',(i-1)*20))
%      
% end