%
'''These Codes Are Written By Mehdi Touyserkani
    Email Address: Ir_Bestpro@yahoo.com
    Website: Https://www.Ir-Bestpro.com
 '''
%

function [Error] = RF(X,Y,type)

%___Random Forests With 10-Fold Cross Validation,10 tree Template_____

k = 10;
cv = cvpartition(Y,'KFold',k);

N.train=cv.TrainSize(1,1);
N.test=cv.TestSize(1,1);

number_Of_Tress = 10; % According To Base Paper

for i=1:10
    
    trIdx = cv.training(i);
    teIdx = cv.test(i);
    
    rng(1); % For reproducibility
    t = TreeBagger(number_Of_Tress,X(trIdx,:),Y(trIdx,:),'Method','classification');
    
    y_hat = predict(t, X(teIdx,:));
    y_hat = str2num(cell2mat(y_hat));
    cm = confusionmat(Y(teIdx),y_hat);

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

