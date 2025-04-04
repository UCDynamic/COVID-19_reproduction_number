function createfigure(X1, Y1, X2, Y2, X3, YMatrix1, X4, Y3, X5, Y4)
%CREATEFIGURE(X1, Y1, X2, Y2, X3, YMatrix1, X4, Y3, X5, Y4)
%  X1:  vector of plot x data
%  Y1:  vector of plot y data
%  X2:  vector of plot x data
%  Y2:  vector of plot y data
%  X3:  vector of plot x data
%  YMATRIX1:  matrix of plot y data
%  X4:  vector of plot x data
%  Y3:  vector of plot y data
%  X5:  vector of plot x data
%  Y4:  vector of plot y data

%  Auto-generated by MATLAB on 18-Feb-2024 18:07:29

% Create figure
figure('WindowState','maximized');

% Create subplot
subplot1 = subplot(2,1,1);
hold(subplot1,'on');

% Create plot
plot(X1,Y1,'DisplayName','Model R_{e}-Training','LineWidth',3);

% Create plot
plot(X2,Y2,'DisplayName','Model R_{e}- Testing','LineWidth',3,'LineStyle','--');

% Create multiple line objects using matrix input to plot
plot1 = plot(X3,YMatrix1);
set(plot1(1),'DisplayName','R_{e}- WT method','Marker','o','LineWidth',3);

% Create ylabel
ylabel('Re','FontWeight','bold','FontSize',20);

% Create xlabel
xlabel('Simulation Time/Days','FontWeight','bold','FontSize',20);

% Create title
title('Re at Hamilton County vs Time','FontSize',20);

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot1,[738202 738246]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(subplot1,[0.6 1.6]);
box(subplot1,'on');
hold(subplot1,'off');
% Set the remaining axes properties
set(subplot1,'XTick',...
    [738202 738203 738204 738205 738206 738207 738208 738209 738210 738211 738212 738213 738214 738215 738216 738217 738218 738219 738220 738221 738222 738223 738224 738225 738226 738227 738228 738229 738230 738231 738232 738233 738234 738235 738236 738237 738238 738239 738240 738241 738242 738243 738244 738245 738246],...
    'XTickLabel',...
    ['15-02';'16-02';'17-02';'18-02';'19-02';'20-02';'21-02';'22-02';'23-02';'24-02';'25-02';'26-02';'27-02';'28-02';'01-03';'02-03';'03-03';'04-03';'05-03';'06-03';'07-03';'08-03';'09-03';'10-03';'11-03';'12-03';'13-03';'14-03';'15-03';'16-03';'17-03';'18-03';'19-03';'20-03';'21-03';'22-03';'23-03';'24-03';'25-03';'26-03';'27-03';'28-03';'29-03';'30-03';'31-03']);
% Create legend
legend1 = legend(subplot1,'show');
set(legend1,'FontWeight','bold','FontSize',18);

% Create subplot
subplot2 = subplot(2,1,2);
hold(subplot2,'on');

% Create plot
plot(X4,Y3,'DisplayName','True Incident Cases','Marker','o','LineWidth',3,...
    'Color',[1 0 1]);

% Create plot
plot(X5,Y4,'DisplayName','5-Day Moving Average','LineWidth',3,...
    'Color',[0 0 1]);

% Create ylabel
ylabel('Incident Cases','FontWeight','bold','FontSize',20);

% Create xlabel
xlabel('Time/Days','FontWeight','bold','FontSize',20);

% Create title
title('Infections During Timeframe-3','FontSize',20);

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot2,[738202 738246]);
box(subplot2,'on');
grid(subplot2,'on');
hold(subplot2,'off');
% Set the remaining axes properties
set(subplot2,'XTick',...
    [738202 738203 738204 738205 738206 738207 738208 738209 738210 738211 738212 738213 738214 738215 738216 738217 738218 738219 738220 738221 738222 738223 738224 738225 738226 738227 738228 738229 738230 738231 738232 738233 738234 738235 738236 738237 738238 738239 738240 738241 738242 738243 738244 738245 738246],...
    'XTickLabel',...
    ['15-02';'16-02';'17-02';'18-02';'19-02';'20-02';'21-02';'22-02';'23-02';'24-02';'25-02';'26-02';'27-02';'28-02';'01-03';'02-03';'03-03';'04-03';'05-03';'06-03';'07-03';'08-03';'09-03';'10-03';'11-03';'12-03';'13-03';'14-03';'15-03';'16-03';'17-03';'18-03';'19-03';'20-03';'21-03';'22-03';'23-03';'24-03';'25-03';'26-03';'27-03';'28-03';'29-03';'30-03';'31-03']);
% Create legend
legend2 = legend(subplot2,'show');
set(legend2,'FontWeight','bold','FontSize',18);

