load('zip_data.mat')
T=readtable('cases_new_mid.csv');
D=readtable('death_new_mid.csv');
R=readtable('recover_new_mid.csv');
X=unique(T.ZIPCode);
S=shaperead('Hamilton_County_Zip_Codes');

for i=1:71
    counter=0;
    for j=1:99
        
    if S(i).ZIPCODE==X(j)
       counter=1; 
    end
    end
    if counter==0
   alpha(i)=0;
    else
         alpha(i)=1;
    end
end
un_match=find(alpha==0);
b=5;
for i=1:5
    
   S(un_match(b))=[]; 
    b=b-1;
end
% mapshow(S);


for i=1:length(S)
 index= find (zipcodes.Var1==S(i).ZIPCODE );
    S(i).population=zipcodes.Var15(index);
     S(i).index=i;
end
T=sortrows(T,2);
D=sortrows(D,2);
R=sortrows(R,2);
T_S = struct2table(S);
T_S=sortrows(T_S,6);
Arr=[]
for i=1:height(T)
    
   if T.ZIPCode(i)<45001 ||  T.ZIPCode(i)>45255 ||  isnan(T.ZIPCode(i))
       Arr=[Arr,i];
   end
end
T(Arr,:)=[]

Arr=[]
for i=1:height(R)
    
   if R.ZIPCode(i)<45001 ||  R.ZIPCode(i)>45255 ||  isnan(R.ZIPCode(i))
       Arr=[Arr,i];
   end
end
R(Arr,:)=[]

Arr=[]
for i=1:height(D)
   AB=((D.ZIPCode(i)));
   if  isempty(AB)
       Arr=[Arr,i];
   elseif AB<45001 ||  AB>45255
 Arr=[Arr,i];
    end
end
D(Arr,:)=[]


%% distribution of I
codes=T_S.ZIPCODE
T.Numdate = datenum(T.Date);
D.Numdate = datenum(datetime(D.Date));
R.Numdate = datenum(R.Date);
count=1;
count_new=1;


for j=1:length(S) % setting different tables for I based on S_map

    
    list=find(T.ZIPCode==S(j).ZIPCODE);
    new_table{j}(:,:)=T(list,:);    
    
end

% making a comon table with numbers%integrating data for I
for j=1:66
Cases_final{j}=zeros(237,9); %237 days starting April 1
end


   for j=1:66
   for i=1:237
                            Cases_final{j}(i,1)=737881+i; %starting April 1
                            
   end
   end
   
   
        for k=1:height(T) %feeding infection data
            AB=find(codes==T.ZIPCode(1)); %Find the zipcode
            if ~isempty(AB)
                A=find(Cases_final{AB}(:,1)==T.Numdate(k)); %find the index of the cases_final where this data is to be copied
                if ~isempty(A) 
                    Cases_final{AB}(A,2)=T.NumberOfCases(k);
                end
            end
        end
            

   
        for k=1:height(D) %feeding DEATH data
            AB=find(codes== D.ZIPCode(k)); %Find the zipcode
            if ~isempty(AB)
                A=find(Cases_final{AB}(:,1)==D.Numdate(k)); %find the index of the cases_final where this data is to be copied
                if ~isempty(A) 
                    Cases_final{AB}(A,3)=D.NumberOfCases(k);
                end
            end
        end
           


   
        for k=1:height(R) %feeding Recovery data
            AB=find(codes== R.ZIPCode(k)); %Find the zipcode
            if ~isempty(AB)
                A=find(Cases_final{AB}(:,1)==R.Numdate(k)); %find the index of the cases_final where this data is to be copied
                if ~isempty(A) 
                    Cases_final{AB}(A,4)=R.NumberOfCases(k);
                end
            end
        end
        
        for AB=1:66 %Cumulative Active Cases and Recoveries
        Cases_final{AB}(:,5) = cumsum(Cases_final{AB}(:,2)-Cases_final{AB}(:,3)-Cases_final{AB}(:,4))
        Cases_final{AB}(:,7) = cumsum(Cases_final{AB}(:,4))
        Cases_final{AB}(1,6) = T_S.population(AB)
        for i=2:237
            Cases_final{AB}(i,6) =  Cases_final{AB}(i-1,6)-Cases_final{AB}(i-1,2) ; 
        end
        end
     
S_final= zeros(237,1)
I_final= zeros(237,1)
R_final= zeros(237,1)
for j=1:237
    for i=1:66
   
      S_final(j)=S_final(j)+Cases_final{i}(j,6); 
      I_final(j)=I_final(j)+Cases_final{i}(j,5);
      R_final(j)=R_final(j)+Cases_final{i}(j,7);
       
   end 
end

% plot(I_final(15:237),'LineWidth',6)
% text(0,0,"1st April",'Color','red')
% xline(52)
% xline(146)
% text(52,590,"22nd May",'Color','red')
% text(146,886,"24th August",'Color','red')
% xline(30,'--r')
% text(30,0,"1st May")
% xline(61,'--r')
% text(61,0,"1st June")
% xline(91,'--r')
% text(91,0,"1st July")
% xline(122,'--r')
% text(122,0,"1st Aug")
% xline(152,'--r')
% text(152,0,"1st Sept")
% xline(183,'--r')
% text(183,0,"1st Oct")
% xline(213,'--r')
% text(213,0,"1st Nov")
% title('Evolution of Infections Hamilton County')
% xlabel('Days')
% ylabel('infections')
% 
% 
% 
% plot(S_final,'LineWidth',6)
% text(0,0,"1st April",'Color','red')
% xline(52)
% xline(146)
% text(52,590,"22nd May",'Color','red')
% text(146,886,"24th August",'Color','red')
% xline(30,'--r')
% text(30,0,"1st May")
% xline(61,'--r')
% text(61,0,"1st June")
% xline(91,'--r')
% text(91,0,"1st July")
% xline(122,'--r')
% text(122,0,"1st Aug")
% xline(152,'--r')
% text(152,0,"1st Sept")
% xline(183,'--r')
% text(183,0,"1st Oct")
% xline(213,'--r')
% text(213,0,"1st Nov")
% title('Evolution of Susceptible Population Hamilton County')
% xlabel('Days')
% ylabel('infections')
% 
% 
% plot(R_final,'LineWidth',6)
% text(0,0,"1st April",'Color','red')
% xline(52)
% xline(146)
% text(52,590,"22nd May",'Color','red')
% text(146,886,"24th August",'Color','red')
% xline(30,'--r')
% text(30,0,"1st May")
% xline(61,'--r')
% text(61,0,"1st June")
% xline(91,'--r')
% text(91,0,"1st July")
% xline(122,'--r')
% text(122,0,"1st Aug")
% xline(152,'--r')
% text(152,0,"1st Sept")
% xline(183,'--r')
% text(183,0,"1st Oct")
% xline(213,'--r')
% text(213,0,"1st Nov")
% title('Evolution of Recovered Population Hamilton County')
% xlabel('Days')
% ylabel('infections')
% 
% 

desc={'date','inf. daily','death. daily','rec. daily','cum. cases','S','Rcum','R_our_method','Rcum_our_method'}

% save('final_plots','S_final','I_final','R_final');
% save('Case_file_v2','Cases_final','desc','S');