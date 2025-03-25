function [env,S_T_loop,I_T_loop]=generate_env(S, grid_size,limits,Cases_Table,param)
    for i=1:57
    poly(i)=polyshape(S(i).X,S(i).Y)
    end
    unite=union(poly(:))

    Y_diff=limits(4)-limits(3);
    X_diff=limits(2)-limits(1);
    for i=1:grid_size
        for j=1:grid_size
    env(j,i).X_lim=[limits(1)+(X_diff/grid_size)*(i-1),limits(1)+(X_diff/grid_size)*(i)];
    env(j,i).Y_lim=[limits(4)-(Y_diff/grid_size)*(j-1),limits(4)-(Y_diff/grid_size)*(j)];
        end
    end
     
    
    for i=1:grid_size
        for j=1:grid_size
            count=0;
            for s=1:57
                xq=[env(j,i).X_lim(1),env(j,i).X_lim(2),env(j,i).X_lim(2),env(j,i).X_lim(1)];
                yq=[env(j,i).Y_lim(2),env(j,i).Y_lim(2),env(j,i).Y_lim(1),env(j,i).Y_lim(1)];
                [in, on]=inpolygon(xq,yq,S(s).X,S(s).Y);
                if (in(1)||in(2)||in(2)||in(3)==1)
                    count=1;
                    env(j,i).county=S(s).ZIPCODE;
                    env(j,i).index=S(s).index;
                    
                end
            end
  

            if count==1
                env(j,i).in_map=true;
            else
                env(j,i).in_map=false;
                env(j,i).index=0;
            end
            
            [in]=inpolygon(xq,yq,unite.Vertices(:,1),unite.Vertices(:,2));
            if (in(1)&& in(2)&& in(3)&& in(4))==0 && (in(1)|| in(2)|| in(3)|| in(4))==1
            env(j,i).boundry=true
            else
            env(j,i).boundry=false
            end
            

        end
        end
%     env(28,13).boundry=false;
%     env(28,14).boundry=false;
%     env(27,13).boundry=false;
%     env(27,14).boundry=false;
%     env(31,8).boundry=false;
%     env(31,9).boundry=false;
%     env(32,8).boundry=false;
%     env(32,9).boundry=false;    
%     env(12,52).boundry=false;
%     env(12,53).boundry=false;
%     env(13,52).boundry=false;
%     env(13,53).boundry=false;
    
    
    for i=1:grid_size
    for j=1:grid_size
        Mat_idx(j,i)=env(j,i).index;
    end
    end
    
for i=1:grid_size
        for j=1:grid_size
    env(j,i).S=0;
    env(j,i).I=0;
    env(j,i).R=0;
        end
end
    

%cells for initial latency
for i= 1:grid_size
   for j=1:grid_size
       for T=1:11
           S_T_loop{j,i}(T)=0;
           I_T_loop{j,i}(T)=0;
          
       end
   end
end
% 
% for i=1:60
% for j=1:60
% 
% latency(j,i)=0;
% for k =1:60  
%  for l=1:60
%      
%      %fa=(1/(sqrt(4*pi*param.alpha)))*exp(-((i-l)^2+(j-k)^2)/(4*param.alpha));
%      latency(j,i)=1%latency(j,i)+(env(l,k).I*env(l,k).S*fa*param.del_x^2);
%      
%  end
% end
% end
% end
% latency=1;
% 
% for j=1:60
% for i=1:60
%     if (env(j,i).in_map==1&&env(j,i).boundry==0)
% env(j,i).S=param.delta/latency;
% env(j,i).I=(param.lambda*latency-param.theta*param.delta)/(param.delta*param.phi);
% env(j,i).R=(param.omega*env(j,i).I)/param.theta;
% S_T_loop{j,i}(:)=param.delta/latency;
% I_T_loop{j,i}(:)=(param.lambda*latency-param.theta*param.delta)/(param.delta*param.phi);
%     end
% end
% end
    for i=1:57
        i
        row=[]
        col=[]
        IDX=i; %county index of interest
        if i~=20
         [row, col]=find(Mat_idx==IDX); %find row and column numbers of the environment with that county
         t_cells=length(row); %total number of cells
         population=Cases_Table{IDX}(10,6)/t_cells;   %pop per cell in a county
         initial_inf=Cases_Table{IDX}(10,5)/t_cells;
         initial_r=Cases_Table{IDX}(10,9)/t_cells;
         for j=1:t_cells
%              NORMAL CASE
             env(row(j),col(j)).S=population;
             env(row(j),col(j)).I=initial_inf;
             env(row(j),col(j)).R=initial_r;

%              env(row(j),col(j)).S=(param.delta*param.lambda)/(param.delta*param.theta+param.e*(param.phi/param.N)*param.phi);
%              env(row(j),col(j)).I=param.e*(param.phi/param.N)/(param.delta);
%              env(row(j),col(j)).R=param.omega*param.e*(param.phi/param.N)/(param.theta*param.delta);
       for g=1:16
             S_T_loop{row(j),col(j)}(g)=Cases_Table{IDX}(10,6)/t_cells;
             I_T_loop{row(j),col(j)}(g)=Cases_Table{IDX}(10,5)/t_cells;
%              S_T_loop{row(j),col(j)}(g)=(param.delta*param.lambda)/(param.delta*param.theta+param.e*(param.phi/param.N)*param.phi);
%              I_T_loop{row(j),col(j)}(g)=param.e*(param.phi/param.N)/(param.delta);
       end
         end
        end
         
         
         
    end

    end
