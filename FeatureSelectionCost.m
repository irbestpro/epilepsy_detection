%
'''These Codes Are Written By Mehdi Touyserkani
    Email Address: Ir_Bestpro@yahoo.com
    Website: Https://www.Ir-Bestpro.com
 '''
%

function [z, out]=FeatureSelectionCost(s,data,Classifier,Y)

    x=data.x';
    t=data.t;
    S=find(s~=0);
    nf=numel(S);
    
    rf=nf/numel(s);

    xs=x(S,:);

    nRun=1;
    EE=zeros(1,nRun);

    for r=1:nRun
        if(strcmp(Classifier,'ANN'))
          EE(r) = ANN(xs',Y,1);
        elseif((strcmp(Classifier,'KNN')))
          EE(r) = KNN(xs',Y,1);
        elseif((strcmp(Classifier,'RF')))
          EE(r) = RF(xs',Y,1);  
        elseif((strcmp(Classifier,'SVM')))
          EE(r) = SVM(xs',Y,1);  
        end
    end
    
    E=mean(EE);
    z = E;

    out.S=S;
    out.nf=nf;
    out.rf=rf;
    out.E=E;
    out.z=z;
    out.xs =xs;
    
end

