  figure(1)
%   subplot(3,1,1)
%   plot((1:55),plot1(1:55), 'LineWidth',3)
% %   hold on
% %   plot((1:45),inf2(1:45), 'LineWidth',3, 'LineStyle','--')
% %   hold on
% %   plot((1:45),inf3(1:45),'LineWidth',3)
% 
%   title('Basic reproductive number(R0) at cell (15,15) vs Time','FontSize',20)
%   xlabel('Time/Days','fontweight','bold','FontSize',20)
%   ylabel('Population','fontweight','bold','FontSize',20)
%   
%   a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
%   grid on
% ax = gca;
% ax.GridColor = [0 .5 .5];
% ax.GridLineStyle = '--';
% ax.GridAlpha = 0.5;
  subplot(3,2,1)             
  plot((1:30),plot4(1:30), 'LineWidth',3)
   hold on
  plot((1:30),t4(1:30,1), 'LineWidth',3, 'LineStyle','--')
  hold on
  plot((1:30),t4(1:30, 2),'LineWidth',3)
  hold on
  plot((1:30), t4(1:30, 3))
  
  title('Re at 45246 vs Time','FontSize',20)
  xlabel('Time/Days','fontweight','bold','FontSize',20)
  ylabel('Re','fontweight','bold','FontSize',20)
 
  a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
  grid on
% ax = gca;
% ax.GridColor = [0 .5 .5];
% ax.GridLineStyle = '--';
% ax.GridAlpha = 0.5;

  subplot(3,2,2)
%  plot((1:45),play1(1:45), 'LineWidth',3)
%  hold on
 plot((1:30),play44(1:30), 'LineWidth',3)
 hold on
  plot((1:30),play44_true(1:30), 'LineWidth',3, 'LineStyle','--')
  hold on
 
  
  title('Infections at 45246','FontSize',20)
  xlabel('Time/Days','fontweight','bold','FontSize',20)
  ylabel('Inf','fontweight','bold','FontSize',20)
   a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
  grid on

  subplot(3,2,3)
   plot((1:30),plot1(1:30), 'LineWidth',3)
   hold on
  plot((1:30),t1(1:30,1), 'LineWidth',3, 'LineStyle','--')
  hold on
  plot((1:30),t1(1:30, 2),'LineWidth',3)
  hold on
  plot((1:30), t1(1:30, 3))
  
  title('Re at 45231','FontSize',20)
  xlabel('Time/Days','fontweight','bold','FontSize',20)
  ylabel('Re','fontweight','bold','FontSize',20)
   a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
  grid on


    subplot(3,2,4)
%  plot((1:30),play2(1:30), 'LineWidth',3)
%   hold on
  plot((1:30),play11(1:30), 'LineWidth',3)
  hold on
  plot((1:30),play11_true(1:30), 'LineWidth',3, 'LineStyle','--')
  hold on
%   plot((1:45),R_loop_OH_True(1:45),'LineWidth',3 )
  title('Infections at cell (26,28)','FontSize',20)
  xlabel('Time/Days','fontweight','bold','FontSize',20)
  ylabel('Inf','fontweight','bold','FontSize',20)
   a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
  grid on


    subplot(3,2,5)
 plot((1:30),plot3(1:30), 'LineWidth',3)
 hold on
  plot((1:30),t3(1:30,1), 'LineWidth',3, 'LineStyle','--')
  hold on
  plot((1:30),t3(1:30, 2),'LineWidth',3)
  hold on
  plot((1:30), t3(1:30, 3))
%   hold on
%   plot((30:45),R_loop_OH(30:45), 'LineWidth',3,'LineStyle','--')
%   hold on
%   plot((1:45),R_loop_OH_True(1:45),'LineWidth',3 )
  title('Re at 45247','FontSize',20)
  xlabel('Time/Days','fontweight','bold','FontSize',20)
  ylabel('Re','fontweight','bold','FontSize',20)
  legend('Model prediction','WT method','Lower Quantile', 'Upper Quantile','fontsize',5)
   a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
  grid on

 subplot(3,2,6)
%  plot((1:45),play3(1:45), 'LineWidth',3)
%   hold on
  plot((1:30),play33(1:30), 'LineWidth',3)
  hold on
   plot((1:30),play33_true(1:30), 'LineWidth',3, 'LineStyle','--')
  hold on
%   plot((1:45),R_loop_OH_True(1:45),'LineWidth',3 )
  title('Infections at 45247','FontSize',20)
  xlabel('Time/Days','fontweight','bold','FontSize',20)
  ylabel('Inf','fontweight','bold','FontSize',20)
  


%     subplot(6,1,3)
%  plot((1:55),plot3(1:55), 'LineWidth',3)
%   hold on
%   plot((30:45),R_loop_OH(30:45), 'LineWidth',3,'LineStyle','--')
%   hold on
%   plot((1:45),R_loop_OH_True(1:45),'LineWidth',3 )
%   title('Basic reproductive number(R0) at cell (35,20)','FontSize',20)
%   xlabel('Time/Days','fontweight','bold','FontSize',20)
%   ylabel('R0','fontweight','bold','FontSize',20)
% 
% 
%     subplot(3,1,3)
%  plot((1:55),plot3(1:55), 'LineWidth',3)
%   hold on
%   plot((30:45),R_loop_OH(30:45), 'LineWidth',3,'LineStyle','--')
%   hold on
%   plot((1:45),R_loop_OH_True(1:45),'LineWidth',3 )
%   title('Basic reproductive number(R0) at cell (35,20)','FontSize',20)
%   xlabel('Time/Days','fontweight','bold','FontSize',20)
%   ylabel('R0','fontweight','bold','FontSize',20)
% 
% 
% 

 
  a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
  grid on
  legend('Model prediction','Real Data','fontsize',7)
% ax = gca;
% ax.GridColor = [0 .5 .5];
% ax.GridLineStyle = '--';
% ax.GridAlpha = 0.5;
% legend('Daily infections without recovered and death','Daily infections')