%
'''These Codes Are Written By Mehdi Touyserkani
    Email Address: Ir_Bestpro@yahoo.com
    Website: Https://www.Ir-Bestpro.com
 '''
%

function [out] = Main()

clc;
warning off;

%____Load Extracted Feature From FFT Algorithm______

addpath './dataSets';
addpath './Wavelets';
addpath './Classification';
addpath './GSA';

Classes = ['A' 'B' 'C' 'D' 'E'];
Inputs = [];
Targets = [];

% %___Collects Data____________

for i=1:numel(Classes)
   Data = csvread([Classes(i) '.csv']);
   Inputs = [Inputs;Data];
   Targets = [Targets;ones(size(Data,1),1)*i];
end

%____Classificaiton________________

features = load('Features');
features = features.features;

features14 = load('Features14');
F1 = features14.features14; % SF SF4

features1256 = load('Features1256');
F2 = features1256.features1256; % SF1,SF2,SF5,SF6

F3 = features; %SF SF6

%______Show Results_________________________

Table = cell(16,5);
%_____EMD____________

Table(1,1) = {'EMD'};
Table(1,2) = {'KNN'};
Table(1,3) = {KNN(F1(:,1:32),Targets,2)};
Table(1,4) = {KNN(F2(:,1:32),Targets,2)};
Table(1,5) = {KNN(F3(:,1:48),Targets,2)};

Table(2,1) = {'EMD'};
Table(2,2) = {'MLP'};
Table(2,3) = {ANN(F1(:,1:32),Targets,2)};
Table(2,4) = {ANN(F2(:,1:32),Targets,2)};
Table(2,5) = {ANN(F3(:,1:48),Targets,2)};

Table(3,1) = {'EMD'};
Table(3,2) = {'SVM'};
Table(3,3) = {SVM(F1(:,1:32),Targets,2)};
Table(3,4) = {SVM(F2(:,1:32),Targets,2)};
Table(3,5) = {SVM(F3(:,1:48),Targets,2)};

Table(4,1) = {'EMD'};
Table(4,2) = {'RF'};
Table(4,3) = {RF(F1(:,1:32),Targets,2)};
Table(4,4) = {RF(F2(:,1:32),Targets,2)};
Table(4,5) = {RF(F3(:,1:48),Targets,2)};

%____DWT_________________

Table(5,1) = {'DWT'};
Table(5,2) = {'KNN'};
Table(5,3) = { KNN(F1(:,33:52),Targets,2)};
Table(5,4) = { KNN(F2(:,33:52),Targets,2)};
Table(5,5) = { KNN(F3(:,49:78),Targets,2)};

Table(6,1) = {'DWT'};
Table(6,2) = {'MLP'};
Table(6,3) = { ANN(F1(:,33:52),Targets,2)};
Table(6,4) = { ANN(F2(:,33:52),Targets,2)};
Table(6,5) = { ANN(F3(:,49:78),Targets,2)};

Table(7,1) = {'DWT'};
Table(7,2) = {'SVM'};
Table(7,3) = { SVM(F1(:,33:52),Targets,2)};
Table(7,4) = { SVM(F2(:,33:52),Targets,2)};
Table(7,5) = { SVM(F3(:,49:78),Targets,2)};

Table(8,1) = {'DWT'};
Table(8,2) = {'RF'};
Table(8,3) = { RF(F1(:,33:52),Targets,2)};
Table(8,4) = { RF(F2(:,33:52),Targets,2)};
Table(8,5) = { RF(F3(:,49:78),Targets,2)};

%____WPD_____________________

Table(9,1) = {'WPD'};
Table(9,2) = {'KNN'};
Table(9,3) = { KNN(F1(:,53:116),Targets,2)};
Table(9,4) = { KNN(F2(:,53:116),Targets,2)};
Table(9,5) = { KNN(F3(:,79:174),Targets,2)};

Table(10,1) = {'WPD'};
Table(10,2) = {'MLP'};
Table(10,3) = { ANN(F1(:,53:116),Targets,2)};
Table(10,4) = { ANN(F2(:,53:116),Targets,2)};
Table(10,5) = { ANN(F3(:,79:174),Targets,2)};

Table(11,1) = {'WPD'};
Table(11,2) = {'SVM'};
Table(11,3) = { SVM(F1(:,53:116),Targets,2)};
Table(11,4) = { SVM(F2(:,53:116),Targets,2)};
Table(11,5) = { SVM(F3(:,79:174),Targets,2)};

Table(12,1) = {'WPD'};
Table(12,2) = {'RF'};
Table(12,3) = { RF(F1(:,53:116),Targets,2)};
Table(12,4) = { RF(F2(:,53:116),Targets,2)};
Table(12,5) = { RF(F3(:,79:174),Targets,2)};

%____CEEMDAN_____________________

Table(13,1) = {'Ceemdan'};
Table(13,2) = {'KNN'};
Table(13,3) = { KNN(F1(:,117:end),Targets,2)};
Table(13,4) = { KNN(F2(:,117:end),Targets,2)};
Table(13,5) = { KNN(F3(:,175:end),Targets,2)};

Table(14,1) = {'Ceemdan'};
Table(14,2) = {'MLP'};
Table(14,3) = { ANN(F1(:,117:end),Targets,2)};
Table(14,4) = { ANN(F2(:,117:end),Targets,2)};
Table(14,5) = { ANN(F3(:,175:end),Targets,2)};

Table(15,1) = {'Ceemdan'};
Table(15,2) = {'SVM'};
Table(15,3) = { SVM(F1(:,117:end),Targets,2)};
Table(15,4) = { SVM(F2(:,117:end),Targets,2)};
Table(15,5) = { SVM(F3(:,175:end),Targets,2)};

Table(16,1) = {'Ceemdan'};
Table(16,2) = {'RF'};
Table(16,3) = { RF(F1(:,117:end),Targets,2)};
Table(16,4) = { RF(F2(:,117:end),Targets,2)};
Table(16,5) = { RF(F3(:,175:end),Targets,2)};

cell2table(Table,'VariableNames',{'Method','Classifier' 'F1' 'F2' 'F3'})

%_____Feature Selection With GSA Features C,D,E_______________

Table = cell(4,5);

YCDE = Targets(201:end,:);
F1_CDE = F1(201:end,:);
F2_CDE = F2(201:end,:);
F3_CDE = F3(201:end,:);

F1_SVM = BGSA('SVM',F1_CDE,YCDE); F1_SVM = F1_SVM == 1; 
F2_SVM = BGSA('SVM',F2_CDE,YCDE); F2_SVM = F2_SVM == 1; 
F3_SVM = BGSA('SVM',F3_CDE,YCDE); F3_SVM = F3_SVM == 1; 

F1_KNN = BGSA('KNN',F1_CDE,YCDE); F1_KNN = F1_KNN == 1; 
F2_KNN = BGSA('KNN',F2_CDE,YCDE); F2_KNN = F2_KNN == 1; 
F3_KNN = BGSA('KNN',F3_CDE,YCDE); F3_KNN = F3_KNN == 1; 

F1_RF = BGSA('RF',F1_CDE,YCDE); F1_RF = F1_RF == 1; 
F2_RF = BGSA('RF',F2_CDE,YCDE); F2_RF = F2_RF == 1; 
F3_RF = BGSA('RF',F3_CDE,YCDE); F3_RF = F3_RF == 1; 

F1_ANN = BGSA('ANN',F1_CDE,YCDE); F1_ANN = F1_ANN == 1; 
F2_ANN = BGSA('ANN',F2_CDE,YCDE); F2_ANN = F2_ANN == 1; 
F3_ANN = BGSA('ANN',F3_CDE,YCDE); F3_ANN = F3_ANN == 1; 

Table(1,1) = {'BGSA-CDE'};
Table(1,2) = {'SVM'};
Table(1,3) = { SVM(F1_CDE(:,F1_SVM),YCDE,2)};
Table(1,4) = { SVM(F2_CDE(:,F2_SVM),YCDE,2)};
Table(1,5) = { SVM(F3_CDE(:,F3_SVM),YCDE,2)};

Table(2,1) = {'BGSA-CDE'};
Table(2,2) = {'KNN'};
Table(2,3) = { KNN(F1_CDE(:,F1_KNN),YCDE,2)};
Table(2,4) = { KNN(F2_CDE(:,F2_KNN),YCDE,2)};
Table(2,5) = { KNN(F3_CDE(:,F3_KNN),YCDE,2)};

Table(3,1) = {'BGSA-CDE'};
Table(3,2) = {'RF'};
Table(3,3) = { RF(F1_CDE(:,F1_RF),YCDE,2)};
Table(3,4) = { RF(F2_CDE(:,F2_RF),YCDE,2)};
Table(3,5) = { RF(F3_CDE(:,F3_RF),YCDE,2)};

Table(4,1) = {'BGSA-CDE'};
Table(4,2) = {'ANN'};
Table(4,3) = {100 - ANN(F1_CDE(:,F1_ANN),YCDE,2)};
Table(4,4) = {100 - ANN(F2_CDE(:,F2_ANN),YCDE,2)};
Table(4,5) = {100 - ANN(F3_CDE(:,F3_ANN),YCDE,2)};

cell2table(Table,'VariableNames',{'Method','Classifier' 'F1' 'F2' 'F3'})

%____Feature Selection With GSA Features A,D,E_____________

Table = cell(4,5);

YADE = [Targets(1:100,:);Targets(301:end,:)];
F1_ADE = [F1(1:100,:); F1(301:end,:)];
F2_ADE = [F2(1:100,:); F2(301:end,:)];
F3_ADE = [F3(1:100,:); F3(301:end,:)];

F1_SVM = BGSA('SVM',F1_ADE,YADE); F1_SVM = F1_SVM == 1; 
F2_SVM = BGSA('SVM',F2_ADE,YADE); F2_SVM = F2_SVM == 1; 
F3_SVM = BGSA('SVM',F3_ADE,YADE); F3_SVM = F3_SVM == 1; 

F1_KNN = BGSA('KNN',F1_ADE,YADE); F1_KNN = F1_KNN == 1; 
F2_KNN = BGSA('KNN',F2_ADE,YADE); F2_KNN = F2_KNN == 1; 
F3_KNN = BGSA('KNN',F3_ADE,YADE); F3_KNN = F3_KNN == 1; 

F1_RF = BGSA('RF',F1_ADE,YADE); F1_RF = F1_RF == 1; 
F2_RF = BGSA('RF',F2_ADE,YADE); F2_RF = F2_RF == 1; 
F3_RF = BGSA('RF',F3_ADE,YADE); F3_RF = F3_RF == 1; 

F1_ANN = BGSA('ANN',F1_ADE,YADE); F1_ANN = F1_ANN == 1; 
F2_ANN = BGSA('ANN',F2_ADE,YADE); F2_ANN = F2_ANN == 1; 
F3_ANN = BGSA('ANN',F3_ADE,YADE); F3_ANN = F3_ANN == 1; 

Table(1,1) = {'BGSA-ADE'};
Table(1,2) = {'SVM'};
Table(1,3) = { SVM(F1_ADE(:,F1_SVM),YADE,2)};
Table(1,4) = { SVM(F2_ADE(:,F2_SVM),YADE,2)};
Table(1,5) = { SVM(F3_ADE(:,F3_SVM),YADE,2)};

Table(2,1) = {'BGSA-ADE'};
Table(2,2) = {'KNN'};
Table(2,3) = {KNN(F1_ADE(:,F1_KNN),YADE,2)};
Table(2,4) = {KNN(F2_ADE(:,F2_KNN),YADE,2)};
Table(2,5) = {KNN(F3_ADE(:,F3_KNN),YADE,2)};

Table(3,1) = {'BGSA-ADE'};
Table(3,2) = {'RF'};
Table(3,3) = {RF(F1_ADE(:,F1_RF),YADE,2)};
Table(3,4) = {RF(F2_ADE(:,F2_RF),YADE,2)};
Table(3,5) = {RF(F3_ADE(:,F3_RF),YADE,2)};

Table(4,1) = {'BGSA-ADE'};
Table(4,2) = {'ANN'};
Table(4,3) = {ANN(F1_ADE(:,F1_ANN),YADE,2)};
Table(4,4) = {ANN(F2_ADE(:,F2_ANN),YADE,2)};
Table(4,5) = {ANN(F3_ADE(:,F3_ANN),YADE,2)};

cell2table(Table,'VariableNames',{'Method','Classifier' 'F1' 'F2' 'F3'})

%_____Feature Selection With GSA Features A,E_______________
% 
Table = cell(4,5);

YAE = [Targets(1:100,:);Targets(401:end,:)];
F1_AE = [F1(1:100,:); F1(401:end,:)];
F2_AE = [F2(1:100,:); F2(401:end,:)];
F3_AE = [F3(1:100,:); F3(401:end,:)];

F1_SVM = BGSA('SVM',F1_AE,YAE); F1_SVM = F1_SVM == 1; 
F2_SVM = BGSA('SVM',F2_AE,YAE); F2_SVM = F2_SVM == 1; 
F3_SVM = BGSA('SVM',F3_AE,YAE); F3_SVM = F3_SVM == 1; 

F1_KNN = BGSA('KNN',F1_AE,YAE); F1_KNN = F1_KNN == 1; 
F2_KNN = BGSA('KNN',F2_AE,YAE); F2_KNN = F2_KNN == 1; 
F3_KNN = BGSA('KNN',F3_AE,YAE); F3_KNN = F3_KNN == 1; 

F1_RF = BGSA('RF',F1_AE,YAE); F1_RF = F1_RF == 1; 
F2_RF = BGSA('RF',F2_AE,YAE); F2_RF = F2_RF == 1; 
F3_RF = BGSA('RF',F3_AE,YAE); F3_RF = F3_RF == 1; 

F1_ANN = BGSA('ANN',F1_AE,YAE); F1_ANN = F1_ANN == 1; 
F2_ANN = BGSA('ANN',F2_AE,YAE); F2_ANN = F2_ANN == 1; 
F3_ANN = BGSA('ANN',F3_AE,YAE); F3_ANN = F3_ANN == 1; 

Table(1,1) = {'BGSA-AE'};
Table(1,2) = {'SVM'};
Table(1,3) = {SVM(F1_AE(:,F1_SVM),YAE,2)};
Table(1,4) = {SVM(F2_AE(:,F2_SVM),YAE,2)};
Table(1,5) = {SVM(F3_AE(:,F3_SVM),YAE,2)};

Table(2,1) = {'BGSA-AE'};
Table(2,2) = {'KNN'};
Table(2,3) = {KNN(F1_AE(:,F1_KNN),YAE,2)};
Table(2,4) = {KNN(F2_AE(:,F2_KNN),YAE,2)};
Table(2,5) = {KNN(F3_AE(:,F3_KNN),YAE,2)};

Table(3,1) = {'BGSA-AE'};
Table(3,2) = {'RF'};
Table(3,3) = {RF(F1_AE(:,F1_RF),YAE,2)};
Table(3,4) = {RF(F2_AE(:,F2_RF),YAE,2)};
Table(3,5) = {RF(F3_AE(:,F3_RF),YAE,2)};

Table(4,1) = {'BGSA-AE'};
Table(4,2) = {'ANN'};
Table(4,3) = {ANN(F1_AE(:,F1_ANN),YAE,2)};
Table(4,4) = {ANN(F2_AE(:,F2_ANN),YAE,2)};
Table(4,5) = {ANN(F3_AE(:,F3_ANN),YAE,2)};

cell2table(Table,'VariableNames',{'Method','Classifier' 'F1' 'F2' 'F3'})

end

