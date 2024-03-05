load('zip_data.mat')
T=readtable('cases_new_mid.csv');
D=readtable('death_new_mid.csv');
R=readtable('recover_new_mid.csv');
X=unique(T.ZIPCode);
S=shaperead('Hamilton_County_Zip_Codes');
% S=shaperead('Hamilton_shapefile')
% Shape=shaperead(''); 
mapshow(S);
% pop_temp=0;
% for i=1:length(S)
%     pop_temp=pop_temp+ S(i).POPULATION;
% end

%Check how many zipcodes in the dataset match with the shapefiles
for i=1:71
    counter=0;
    for j=1:96
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
% un_match=find(alpha==0);
% b=11;
% for i=1:11
%    S(un_match(b))=[]; 
%     b=b-1;
% end
mapshow(S);

%indicing each zipcode
for i=1:length(S)
 index= find (zipcodes.Var1==S(i).ZIPCODE );
    S(i).population=zipcodes.Var15(index);
     S(i).index=i;
end

%% distribution of I

T.Numdate = datenum(T.Date);
D.Numdate = datenum(D.Date);
R.Numdate = datenum(R.Date);
count=1;
count_new=1;
%recoveries as per the dataset
for i=1:length(S)
   recover_cases{i}= R((i-1)*60+1:60+(i-1)*60,:);
end

for j=1:length(S)
Cases_final{j}=zeros(95,9);
Cases_final{j}(1,1)= 738140;
end

for j= 1:length(S)
    for i= 2:75
        Cases_final{j}(i,1) = Cases_final{j}(i-1,1)+1;      %starting from Feb 15
    end
end



for j=1:length(S) % setting different tables for I based on S_map
    count1=1;
    count=1;
    for i=1:3870
        
       if (S(j).ZIPCODE==T.ZIPCode(i))
           temp1= T.Numdate(i) - Cases_final{j}(count,1);
           Cases_final{j}(count+temp1,2)= T.NumberOfCases(i);
           count=count+1;
       end
       if i<477 && (S(j).ZIPCODE==D.ZIPCode(i))
         Cases_final{j}((D.Numdate(i) - D.Numdate(1)+1),3) = D.NumberOfCases(i);
           count1=count1+1; 
       end
    end
        
end
%    Cases_final{j}(:,2)=cumsum(Cases_final{j}(:,2));
%     Cases_final{j}(:,3)=cumsum(Cases_final{j}(:,3));%cumulative deaths

%integrating data for recovery
for j=1:length(S)
    zip=(recover_cases{j}.ZIPCode(1));
    for i=1:66
       if zip==S(i).ZIPCODE
          break;    
       end
    end
  Cases_final{i}(45:95,4)=table2array(recover_cases{j}(1:51,3)); %recoveries starting 45 days after that
  Cases_final{i}(Cases_final{i}<0)=0;%make negative values to be 0
  Cases_final{i}(:,7)=cumsum(Cases_final{i}(:,4));%cumulative recoveries
end
% S Population

%cum cases
for i=1:length(S)
Cases_final{i}(1,5)=0;
Cases_final{i}(1,6)=S(i).population-Cases_final{i}(1,2)-Cases_final{i}(1,3)-Cases_final{i}(1,8);
% Cases_final{i}(1,10)= S(i).ZIPCODE;
for j=2:95
   Cases_final{i}(j,5)=Cases_final{i}(j-1,2)+Cases_final{i}(j-1,5)-Cases_final{i}(j-1,3)-Cases_final{i}(j-1,8);%cumulative cases
   % infection.daily + yesterdays_cum_infections  - daily death - daily recovered

   Cases_final{i}(j,6)=Cases_final{i}(j-1,6)-Cases_final{i}(j-1,2);
   %susceptible = yesterdays susceptible - daily infection

 if j>10 
    Cases_final{i}(j,8)=0.8*(Cases_final{i}(j-9,5)-sum(Cases_final{i}(1:j,3))-Cases_final{i}(j-1,9)); 
    %0.8 * (cum cases 10 days back - deaths that day - yesterdays cum recovered) 
    
     Cases_final{i}(j,9)=sum(Cases_final{i}(1:j,8));%Recovered
 end       
end   
end

Cases_final_zip{1,1}(:,:)= Cases_final{1,34}(:,:);
desc={'date','inf. daily','death. daily','rec. daily','cum. cases','S','Rcum','R_our_method','Rcum_our_method'}
% S= shaperead('45231 shapefile')

% save('test_cases','Cases_final','desc','S');