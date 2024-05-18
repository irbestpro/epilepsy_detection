function a=BGfield(M,X,G,Rpower,ElitistCheck,iteration,max_it)
[N,dim]=size(X);
 final_per=2; %In the last iteration, only 2 percent of agents apply force to the others.
%%%%total force calculation
 if ElitistCheck==1
     kbest=final_per+(1-iteration/max_it)*(100-final_per); %kbest in eq. 3.
     kbest=round(N*kbest/100);
 else
     kbest=N; 
 end
 
 [Ms ds]=sort(M,'descend');
 for i=1:N
     E(i,:)=zeros(1,dim);
     for ii=1:kbest
         j=ds(ii);
         if j~=i
            R=sum(X(i,:)~=X(j,:)); R=R/dim; %normalized Hamming distance.
         for k=1:dim 
             E(i,k)=E(i,k)+rand*(M(j))*((X(j,k)-X(i,k))/(R^Rpower+1/dim));
              %note that Mp(i)/Mi(i)=1
         end
         end
     end
 end
%%acceleration
a=E.*G; %note that Mp(i)/Mi(i)=1

end
