  true_ro_wt= readtable('WT Hamilton tau_5_new.csv', 'PreserveVariableNames', true);
  true_ro_cori = readtable('Re estimates from Cori method for Hamilton County during 3 time frames using SI5-sd3 30day window - correcting T2.csv', 'PreserveVariableNames', true);
  % temp= readtable('WT Hamilton tau_10.csv', 'PreserveVariableNames', true);
x=0;

%% First timeframe
% for i= 1:843
% %     if true_ro.time_frame(i)==3 && i >=206
%     % if i >= 196 && i <= 300
%     if true_ro_wt.time_frame(i)==1 && true_ro_wt.SI_sd(i)==5
%         x=x+1;
%         t1(x,1)= true_ro_wt(i,8);
%         % t1(x,2)= true_ro(i,10);
%         % t1(x,3)= true_ro(i,11);
%     end
% end
% x=0;
% for i= 1:94
% %     if true_ro.time_frame(i)==3 && i >=206
%     % if i >= 196 && i <= 300
%     if true_ro_cori.time_frame(i)==1 && true_ro_cori.SI_sd(i)==3
%         x=x+1;
%         % t1(x,1)= true_ro_wt(i,8);
%         t1(x,2)= true_ro_cori(i,8);
%         % t1(x,3)= true_ro(i,11);
%     end
% end
% t1= table2array(t1);
% 
% nul = ones(50,1);
% 
% figure(1)
% subplot(2,1,1)
% datic= datenum('04/20/2020','mm/dd/yyyy'):datenum('05/19/2020','mm/dd/yyyy');
% datic1= datenum('05/20/2020','mm/dd/yyyy'):datenum('06/03/2020','mm/dd/yyyy');
% datic2= datenum('04/20/2020','mm/dd/yyyy'):datenum('06/03/2020','mm/dd/yyyy');
% plot(datic,r_day(1:30), 'LineWidth',3)
% hold on
% plot(datic1,r_day(31:45), 'LineWidth',3 , 'LineStyle','--')
% hold on
% plot(datic2,t1(1:45,1), 'LineWidth',3, 'Marker','o')
%   hold on
%   plot(datic2,t1(1:45,2), 'LineWidth',3)
%   % hold on
%   % plot(datic2,t1(1:45,3))
%   hold on
%   plot(datic2, nul(1:45))
% 
%       dat=(datestr(datic2,'dd-mm'))
%     xt=get(gca,'xtick')
%     xt1=linspace(min(xt), max(xt),size(dat,1));
%     set(gca,'xtick',xt1)
%     set(gca,'xticklabel',dat)
% 
%   title('Re at Hamilton County vs Time','FontSize',20)
%   xlabel('Simulation Time/Days','fontweight','bold','FontSize',20)
%   ylabel('Re','fontweight','bold','FontSize',20)
%   legend('Model R_{e}-Training','Model R_{e}- Prediction','R_{e}- WT method','R_{e}- Cori method','fontsize',18, 'FontWeight', 'bold')
%   % xlim([11 60])
%   ylim([0.6 1.5])
% 
% 
%   subplot(2,1,2)
%  % plot(datic2,I_sum_test(1:45), 'LineWidth',3)
%  % hold on
%   plot(datic2,I_true(1:45), 'LineWidth',3, 'Marker', 'o' , 'Color', 'magenta')
%   hold on
%   plot(datic2(5:45), inf_avg(5:45), 'LineWidth',3, 'Color', 'blue')
% 
%   dat=datestr(datic2,'dd-mm')
%     hold on
%   xt=get(gca,'xtick')
%     xt1=linspace(min(xt), max(xt),size(dat,1))
%     set(gca,'xtick',xt1)
%     set(gca,'xticklabel',dat)
% 
%   title('Infections During Timeframe-1','FontSize',20)
%   xlabel('Time/Days','fontweight','bold','FontSize',20)
%   ylabel('Incident Cases','fontweight','bold','FontSize',20)
%   legend('True Incident Cases','5-Day Moving Average', 'FontSize',18, 'FontWeight', 'bold')
%    a = get(gca,'XTickLabel');
% % set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
%   grid on


%% second timeframe
% 
true_ro= readtable('WT Hamilton tau 5_new_peak.csv', 'PreserveVariableNames', true);
x=0;
true_ro_wt.Numdate= datenum(true_ro_wt.end_dt);
dtFormat= 'dd/MM/yyyy'
start_date= datenum('15/10/2020', dtFormat)

% for i=1:size(true_ro_wt,1)
%     if true_ro_wt.Numdate(i)>=start_date
%         x=x+1;
%         t1(x,1)= true_ro_wt(i,8);
%         t1(x,2)= true_ro_cori(i,8);
%         if x==60
%             break
%         end
%     end
% end

x=0;
true_ro.Numdate= datenum(true_ro.end_dt);
dtFormat= 'dd/MM/yyyy'
start_date= datenum('15/10/2020', dtFormat)

for i=1:size(true_ro,1)
    if true_ro.Numdate(i)>=start_date
        x=x+1;
        t1(x,1)= true_ro(i,8);
        if x==60
            break
        end
    end
end

% for i= 96:190
% %     if true_ro.time_frame(i)==3 && i >=206
%     % if i >= 196 && i <= 300
%     if true_ro_wt.time_frame(i)==2 && true_ro_wt.SI_sd(i)==1
%         x=x+1;
%         t1(x,1)= true_ro_wt(i,8);
%         % t1(x,2)= true_ro_cori(i,8);
%         % t1(x,3)= true_ro(i,11);
%     end
% end
x=0;
for i= 96:190
%     if true_ro.time_frame(i)==3 && i >=206
    % if i >= 196 && i <= 300
    if true_ro_cori.time_frame(i)==2 && true_ro_cori.SI_sd(i)==3
        x=x+1;
        % t1(x,1)= true_ro_wt(i,8);
        t1(x,2)= true_ro_cori(i,8);
        % t1(x,3)= true_ro(i,11);
    end
end

t1= table2array(t1);

nul = ones(50,1);

figure(1)
subplot(2,1,1)
datic= datenum('10/15/2020','mm/dd/yyyy'):datenum('11/13/2020','mm/dd/yyyy');
datic1= datenum('11/14/2020','mm/dd/yyyy'):datenum('11/28/2020','mm/dd/yyyy');
datic2= datenum('10/15/2020','mm/dd/yyyy'):datenum('11/28/2020','mm/dd/yyyy');
datic3= datenum('10/15/2020','mm/dd/yyyy'):datenum('12/13/2020','mm/dd/yyyy');

plot(datic,r_day(1:30), 'LineWidth',3)
hold on
plot(datic1,r_day(31:45), 'LineWidth',3 , 'LineStyle','--')
hold on
plot(datic2,t1(1:45,1), 'LineWidth',3, 'Marker','o')
hold on
plot(datic2,t1(1:45,2), 'LineWidth',3)
hold on
plot(datic2, nul(1:45))

dat=datestr(datic2,'dd-mm')
xt=get(gca,'xtick')
xt1=linspace(738079, 738123,size(dat,1))
set(gca,'xtick',xt1)
set(gca,'xticklabel',dat)
xlim([738079 738123]);
% Adjust the position of the first subplot to make it narrower
pos1 = get(gca, 'Position'); % gets the position of the current axis
pos1(3) = 0.749 * pos1(3); % reduce width by half
set(gca, 'Position', pos1); % set the position of the current axis

title('Re at Hamilton County vs Time','FontSize',20)
xlabel('Simulation Time/Days','fontweight','bold','FontSize',20)
ylabel('Re','fontweight','bold','FontSize',20)
% xlim([11 60])
ylim([0.6 1.6])
legend('Model R_{e}-Training','Model R_{e}- Prediction','R_{e}- WT method','R_{e}- Cori method','fontsize',18, 'FontWeight', 'bold')

subplot(2,1,2)
plot(datic3,I_true(1:60), 'LineWidth',3, 'Marker', 'o' , 'Color', 'magenta')
hold on
plot(datic3(5:60), inf_avg(5:60), 'LineWidth',3, 'Color', 'blue')
hold on


dat=datestr(datic3,'dd-mm')
xt=get(gca,'xtick')
xt1=linspace(738079, 738138,size(dat,1))
set(gca,'xtick',xt1)
set(gca,'xticklabel',dat)
xlim([738079 738138]);
% Adjust the position of the first subplot to make it narrower
pos1 = get(gca, 'Position'); % gets the position of the current axis
pos1(3) = 1 * pos1(3); % reduce width by half
set(gca, 'Position', pos1); % set the position of the current axis


title('Infections During Timeframe-2','FontSize',20)
xlabel('Time/Days','fontweight','bold','FontSize',20)
ylabel('Incident Cases','fontweight','bold','FontSize',20)
legend('True Incident Cases', '5-Day Moving Average', 'FontSize',18, 'FontWeight', 'bold')
a = get(gca,'XTickLabel');
grid on

 

%% Third timeframe
% x=0;
% for i= 1:835
% % if true_ro.time_frame(i)==3 && i >=206
% %     if i >= 788 && i <= 842
% if true_ro_wt.time_frame(i) == 3 && true_ro_wt.SI_sd(i)==5
%     x=x+1;
%     t1(x,1)= true_ro_wt(i,8);
%     % t1(x,2)= true_ro(i,10);
%     % t1(x,3)= true_ro(i,11);
% end
% end
% x = 0;
% for i = 1:281
%     if true_ro_cori.time_frame(i) == 3 && true_ro_cori.SI_sd(i)==3
%     x=x+1;
%     t1(x,2)= true_ro_cori(i,8);
%     % t1(x,2)= true_ro(i,10);
%     % t1(x,3)= true_ro(i,11);
% end
% end
% 
% t1= table2array(t1);
% 
% nul = ones(50,1);
% 
% figure(1)
% subplot(2,1,1)
% datic= datenum('02/20/2021','mm/dd/yyyy'):datenum('03/21/2021','mm/dd/yyyy');
% datic= datenum('02/15/2021','mm/dd/yyyy'):datenum('03/16/2021','mm/dd/yyyy');
% 
% datic1= datenum('03/22/2021','mm/dd/yyyy'):datenum('04/05/2021','mm/dd/yyyy');
% datic1= datenum('03/17/2021','mm/dd/yyyy'):datenum('03/31/2021','mm/dd/yyyy');
% 
% datic2= datenum('02/20/2021','mm/dd/yyyy'):datenum('04/05/2021','mm/dd/yyyy');
% datic2= datenum('02/15/2021','mm/dd/yyyy'):datenum('03/31/2021','mm/dd/yyyy');
% 
%   plot(datic,r_day(1:30), 'LineWidth',3)
%    hold on
%    plot(datic1,r_day(31:45), 'LineWidth',3 , 'LineStyle','--')
%    hold on
%   plot(datic2,t1(1:45,1), 'LineWidth',3, 'Marker','o')
%   hold on
%   plot(datic2,t1(1:45,2), 'LineWidth',3)
%   % hold on
%   % plot(datic2,t1(1:45,3))
%   hold on
%   plot(datic2, nul(1:45))
% 
%       dat=datestr(datic2,'dd-mm')
%     xt=get(gca,'xtick')
%     % xt1=linspace(min(xt), max(xt),size(dat,1))
%     xt1=linspace(738202, 738246,size(dat,1))
%     set(gca,'xtick',xt1)
%     set(gca,'xticklabel',dat)
%     xlim([min(datic2) max(datic2)]);
% 
%   title('Re at Hamilton County vs Time','FontSize',20)
%   xlabel('Simulation Time/Days','fontweight','bold','FontSize',20)
%   ylabel('Re','fontweight','bold','FontSize',20)
%   % xlim([11 60])
%   ylim([0.6 1.6])
%   legend('Model R_{e}-Training','Model R_{e}- Prediction','R_{e}- WT method','R_{e}- Cori method','fontsize',18, 'FontWeight', 'bold')
% 
% 
% % subplot(2,1,2)
% %  plot(datic2,I_daily_model(1:45), 'LineWidth',3)
% %  hold on
% %   plot(datic2,I_daily_true(1:45), 'LineWidth',3, 'LineStyle','--')
% %   hold on
% 
% subplot(2,1,2)
%  % plot(datic2,I_sum_test(1:45), 'LineWidth',3)
%  % hold on
% plot(datic2,I_true(1:45), 'LineWidth',3, 'Marker', 'o' , 'Color', 'magenta')
%   hold on
%   plot(datic2(5:45), inf_avg(5:45), 'LineWidth',3, 'Color', 'blue')
%   hold on
% 
% 
%   dat=datestr(datic2,'dd-mm')
%     xt=get(gca,'xtick')
%     % xt1=linspace(min(xt), max(xt),size(dat,1))
%     xt1=linspace(738202, 738246,size(dat,1))
%     set(gca,'xtick',xt1)
%     set(gca,'xticklabel',dat)
%     xlim([min(datic2) max(datic2)]);
% 
%   title('Infections During Timeframe-3','FontSize',20)
%   xlabel('Time/Days','fontweight','bold','FontSize',20)
%   ylabel('Incident Cases','fontweight','bold','FontSize',20)
%   legend('True Incident Cases', '5-Day Moving Average', 'FontSize',18, 'FontWeight', 'bold')
%    a = get(gca,'XTickLabel');
%   grid on
%   boldify(3,3)

  
%%
% delete(t1);