  % true_ro= readtable('WT Hamilton tau_5_new.csv', 'PreserveVariableNames', true);
  true_ro = readtable('Re estimates from WT and Cori method for Ohio between 2020-04-20 and 2020-06-03 using SI5-sd3 30day window.csv', 'PreserveVariableNames', true);
  % temp= readtable('WT Hamilton tau_10.csv', 'PreserveVariableNames', true);
x=0;

% First timeframe
for i= 1:70
%     if true_ro.time_frame(i)==3 && i >=206
    % if i >= 196 && i <= 300
    if true_ro.time_frame(i)==1 && true_ro.SI_sd(i)==3
        x=x+1;
        t1(x,1)= true_ro(i,8);
        t1(x,2)= true_ro(i,9);
        % t1(x,3)= true_ro(i,11);
    end
end
r_day_test = r_day(11:end);
t1= table2array(t1);
% 
nul = ones(50,1);
% 
figure(1)
subplot(2,1,1)
% Change the plot leng
% datic= datenum('05/01/2020','mm/dd/yyyy'):datenum('05/19/2020','mm/dd/yyyy');
% datic1= datenum('05/20/2020','mm/dd/yyyy'):datenum('05/31/2020','mm/dd/yyyy');
% datic2= datenum('05/01/2020','mm/dd/yyyy'):datenum('05/31/2020','mm/dd/yyyy');
datic= datenum('04/30/2020','mm/dd/yyyy'):datenum('05/19/2020','mm/dd/yyyy');
datic1= datenum('05/20/2020','mm/dd/yyyy'):datenum('06/02/2020','mm/dd/yyyy');
datic2= datenum('04/30/2020','mm/dd/yyyy'):datenum('06/02/2020','mm/dd/yyyy');
% figure(1)
% subplot(2,1,1)
% datic= datenum('05/01/2020','mm/dd/yyyy'):datenum('05/19/2020','mm/dd/yyyy');
% datic1= datenum('05/20/2020','mm/dd/yyyy'):datenum('05/31/2020','mm/dd/yyyy');
% datic2= datenum('05/01/2020','mm/dd/yyyy'):datenum('05/31/2020','mm/dd/yyyy');
plot(datic,r_day_test(1:20), 'LineWidth',3)
hold on
plot(datic1,r_day_test(21:34), 'LineWidth',3 , 'LineStyle','--')
hold on
plot(datic2,t1(11:44,1), 'LineWidth',3, 'Marker','o')
hold on
plot(datic2,t1(11:44,2), 'LineWidth',3)
hold on
% plot(datic2,t1(1:45,3))
% hold on
plot(datic2, nul(1:34))

dat=(datestr(datic2,'dd-mm'));
xt=get(gca,'xtick')
xt1=linspace(min(xt), max(xt),size(dat,1));
set(gca,'xtick',xt1)
set(gca,'xticklabel',dat)

title('Re in the state of Ohio vs Time','FontSize',20)
xlabel('Simulation Time/Days','fontweight','bold','FontSize',20)
ylabel('Re','fontweight','bold','FontSize',20)
legend('Model R_{e}-Training','Model R_{e}- Prediction','R_{e}- WT method','R_{e}- Cori method','fontsize',14, 'FontWeight', 'bold')
% legend('Model R_{e}-Training','Model R_{e}- Prediction','fontsize',18, 'FontWeight', 'bold')
% xlim([11 60])
ylim([0.6 1.5])

subplot(2,1,2)
% plot(datic2,I_sum_test(1:45), 'LineWidth',3)
% hold on
plot(datic2,I_true(11:44), 'LineWidth',3, 'Marker', 'o' , 'Color', 'magenta')
hold on
plot(datic2, inf_avg(11:44), 'LineWidth',3, 'Color', 'blue')

dat=datestr(datic2,'dd-mm')
hold on
xt=get(gca,'xtick')
xt1=linspace(min(xt), max(xt),size(dat,1))
set(gca,'xtick',xt1)
set(gca,'xticklabel',dat)

title('Infections During Timeframe-1','FontSize',20)
xlabel('Time/Days','fontweight','bold','FontSize',20)
ylabel('Incident Cases','fontweight','bold','FontSize',20)
legend('True Incident Cases','5-Day Moving Average', 'FontSize',14, 'FontWeight', 'bold')
ylim([350 1400])
a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
grid on


