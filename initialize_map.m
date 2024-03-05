% load('test_cases');
% load('x');
param=chromosome(x)
% figure (1)
% 
mapshow(S);

    min_X=1.3*10e5;
    max_X=1.5*10e5;
    min_Y=3.4*10e4;
    max_Y=5.4*10e4;
    grid=50;
    grid_size=60;
    limits=[min_X, max_X, min_Y, max_Y]   

[env]=generate_env(S, grid_size,limits,Cases_final,param)  


for i=1:grid_size
    for j=1:grid_size
        
   Mat_1(j,i)=env(j,i).boundry     ;
        
    end
end

for i=1:grid_size
    for j=1:grid_size
   Mat(j,i)=env(j,i).in_map;    
    end
end
for i=1:grid_size
    for j=1:grid_size
   Mat_i(j,i)=env(j,i).I;
    end
end

figure(1)
imagesc(Mat_1)
figure(2)
imagesc(Mat)
% xline([2,4])
title('GRID MESH OF HAMILTON COUNTY OH')
% grid on
ax = gca
ax.LineWidth = 1.5



figure(3)
mapshow(S)
grid on

subplot(1,2,1)
imagesc(Mat)
xlabel('cells','FontSize',20)
ylabel('cells','FontSize',20)

% set(gcf,'units','points','position',[10,10,1000,1000])
axis square
grid on
grid minor
title('GRID MESH OF HAMILTON COUNTY OH','FontSize',25)
subplot(1,2,2)

mapshow(S)

title('MAP OF HAMILTON COUNTY OH','FontSize',25)
xlabel('miles (as per the map of USA)','FontSize',20)
ylabel('miles (as per the map of USA)','FontSize',20)


% figure(4)
% imagesc(Mat_i)


% save('env_mid','env','Cases_final')
    