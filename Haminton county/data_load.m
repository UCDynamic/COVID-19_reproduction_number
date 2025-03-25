load('Case_file');
S_sum=zeros(95);
I_sum=zeros(95);
R_sum=zeros(95);
R_our_sum=zeros(95);
for i=1:95
for j=1:57
   S_sum(i)=S_sum(i)+Cases_final{j}(i,6);
   I_sum(i)=I_sum(i)+Cases_final{j}(i,5);
   R_sum(i)=R_sum(i)+Cases_final{j}(i,7);
   R_our_sum(i)=R_our_sum(i)+Cases_final{j}(i,9);
    
end
end
subplot(4,1,1)
plot((1:95),S_sum)
title('S population starting April 15th')
subplot(4,1,2)
plot((1:95),I_sum)
title('I population starting April 15th')
subplot(4,1,3)
plot((1:95),R_sum)
title('R(dataset) population starting April 15th')
subplot(4,1,4)
plot((1:95),R_our_sum)
title('R (our calculations) population starting April 15th')