%
'''These Codes Are Written By Mehdi Touyserkani
    Email Address: Ir_Bestpro@yahoo.com
    Website: Https://www.Ir-Bestpro.com
 '''
%

function [Error] = SVM(X,Y,type)

%___SVM With 10-Fold Cross Validation,polynomial Kernel_____

k = 10;
cv = cvpartition(Y,'KFold',k);

N.train=cv.TrainSize(1,1);
N.test=cv.TestSize(1,1);

for i=1:k
    
    trIdx = cv.training(i);
    teIdx = cv.test(i);
    
    Train_Data = X(trIdx,:);
    Train_Labels = Y(trIdx,:);
    
    TestSet = X(teIdx,:);
    TestLabels = Y(teIdx,:);
    
    u=unique(Y);
    numClasses=length(u);
    y_hat = zeros(N.test,1);
   
    %build models
    for k=1:numClasses
        %Vectorized statement that binarizes Group
        %where 1 is the current class and 0 is all other classes
        G1vAll=(Train_Labels==u(k)); % One versus all Method For Multi Classification
        models(k) = svmtrain(Train_Data,G1vAll,'kernel_function','polynomial');
    end
    
    %classify test cases
    for j=1:size(TestSet,1)
        for k=1:numClasses
            if(svmclassify(models(k),TestSet(j,:)) == 1) 
                break;
            end
        end
        y_hat(j) = u(k);
    end
    
    cm = confusionmat(TestLabels,y_hat);
    
    TN=cm(1,1);
    TP=cm(2,2);
    FP=cm(1,2);
    FN=cm(2,1);
    
    if(numel(unique(Y))==2) 
        
      Accuracy(i)=(TP+TN)/N.test; % For Binary Classification
      sen(i) = TP / (TP+FN);
      spe(i) = TN / (TN+FP);
      
    else
        
        TP=zeros(1,3);
        FN=zeros(1,3);
        FP=zeros(1,3);
        TN=zeros(1,3);
        
        for k=1:3
            TP(k)=cm(k,k);
            FN(k)=sum(cm(k,:))-cm(k,k);
            FP(k)=sum(cm(:,k))-cm(k,k);
            TN(k)=sum(cm(:))-TP(k)-FP(k)-FN(k);
        end
        
        Accuracy(i)=sum(diag(cm))/N.test;
        sen(i) = TP / (TP+FN);
        spe(i) = TN / (TN+FP);
        
    end
end

%__if type==1 return missclassification error else return performance_____


if(type==1)
    Error = 1 -  mean(Accuracy); % Error = 1-accuracy
else
    Error = ['acc=' num2str(mean(Accuracy)) ',sen=' num2str(mean(sen)) ',spe=' num2str(mean(spe))];
end


end

