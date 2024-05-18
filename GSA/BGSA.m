function [Lbest]=BGSA(Classifier,Dataset,Y)

N=2; 
max_it=1; 
ElitistCheck=1; Rpower=1;
min_flag=1; % 1: minimization, 0: maximization

data=LoadData(Dataset);
CostFunction=@(s,Y) FeatureSelectionCost(s,data,Classifier,Y);     % Cost Function
nVar=data.nx;
 
X = zeros(N,nVar); 
%random initialization of agents.
X=randi([0 1],[N nVar]); 

V=zeros(N,nVar); % Velocity

for iteration=1:max_it

    disp(['Iteration #' num2str(iteration)]);
    for i=1:N
       %Evaluation of agents.
       [fitness(i) ~]=CostFunction(X(i,:),Y);
    end
     
    %%%keep better results
    if iteration>1
        if min_flag==1   %minimization
            afit=find(fitness>fitnessold);
        else             %maximization
            afit=find(fitness<fitnessold);
        end
    X(afit,:)=Xold(afit,:);fitness(afit)=fitnessold(afit);
    end
    %%%
    
    if min_flag==1
    [best best_X]=min(fitness); %minimization.
    else
    [best best_X]=max(fitness); %maximization.
    end        
    
    if iteration==1
       Fbest=best;Lbest=X(best_X,:);
    end
    if min_flag==1
      if best<Fbest  %minimization.
       Fbest=best;Lbest=X(best_X,:);
      end
    else 
      if best>Fbest  %maximization
       Fbest=best;Lbest=X(best_X,:);
      end
    end
     
%Calculation of M. eq.8-12
[M]=massCalculation(fitness,min_flag); 
%Calculation of Gravitational constant. eq.7.
G=BGconstant(iteration,max_it); 
%Calculation of accelaration in the gravitational field. eq.2-4.
a=BGfield(M,X,G,Rpower,ElitistCheck,iteration,max_it);
%%%
Xold=X;fitnessold=fitness;
%Agent movement. eq.13-14
[X,V]=Bmove(X,a,V);
end %iteration

end
