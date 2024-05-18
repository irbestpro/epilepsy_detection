%
'''These Codes Are Written By Mehdi Touyserkani
    Email Address: Ir_Bestpro@yahoo.com
    Website: Https://www.Ir-Bestpro.com
 '''
%

function [out] = Statistical_Features14(emd_features,wpd_features,dwt_features,CEE)

%____According To Section 2.4________

%___Statistical For EMD______________

emd_f = [];

for i=1:8
    
    emd_f = [emd_f meanabs(emd_features(i,:))]; % Meand Of Absolute Coefficient Values
    emd_f = [emd_f rms(emd_features(i,:))]; %(1/numel(X)) * sum(X(:).^2)]; % Average Power Of Cofficients 
    emd_f = [emd_f std(emd_features(i,:))]; % Standard Deviation
    emd_f = [emd_f meanabs(emd_features(i,:)) / meanabs(emd_features(mod(i,size(emd_features,1))+1,:))]; % Ratio Of Absolute Sub Bands
    
end

%___Statistical For CEE______________

CEE_f = [];

for i=1:8
    
    CEE_f = [CEE_f meanabs(CEE(i,:))]; % Meand Of Absolute Coefficient Values
    CEE_f = [CEE_f rms(CEE(i,:))]; %(1/numel(X)) * sum(X(:).^2)]; % Average Power Of Cofficients 
    CEE_f = [CEE_f std(CEE(i,:))]; % Standard Deviation
    CEE_f = [CEE_f meanabs(CEE(i,:)) / meanabs(CEE(mod(i,size(CEE,1))+1,:))]; % Ratio Of Absolute Sub Bands
    
end

%___Statistical For WPD______________

wpd_f = [];

for i=1:16   
    
    wpd_f = [wpd_f meanabs(wpd_features(i,:))]; % Meand Of Absolute Coefficient Values
    wpd_f = [wpd_f rms(wpd_features(i,:))]; %(1/numel(X)) * sum(X(:).^2)]; % Average Power Of Cofficients 
    wpd_f = [wpd_f std(wpd_features(i,:))]; % Standard Deviation
    wpd_f = [wpd_f meanabs(wpd_features(i,:)) / meanabs(wpd_features(mod(i,size(wpd_features,1))+1,:))]; % Ratio Of Absolute Sub Bands
    
end

%___Statistical For DWT______________

D1 = dwt_features(1,1:1027);
D2 = dwt_features(1,1028:1544);
D3 = dwt_features(1,1545:1806);
D4 = dwt_features(1,1807:1940);
% D5 = dwt_features(1,3862:3995);
% D6 = dwt_features(1,3996:4065);
A = dwt_features(1,1941:end);


dwt_f = [];
dwt_f = [dwt_f meanabs(D1)];
dwt_f = [dwt_f meanabs(D2)];
dwt_f = [dwt_f meanabs(D3)];
dwt_f = [dwt_f meanabs(D4)];
% dwt_f = [dwt_f meanabs(D5)];
% dwt_f = [dwt_f meanabs(D6)];
dwt_f = [dwt_f meanabs(A)];

dwt_f = [dwt_f rms(D1)];
dwt_f = [dwt_f rms(D2)];
dwt_f = [dwt_f rms(D3)];
dwt_f = [dwt_f rms(D4)];
% dwt_f = [dwt_f rms(D5)];
% dwt_f = [dwt_f rms(D6)];
dwt_f = [dwt_f rms(A)];

dwt_f = [dwt_f std(D1)];
dwt_f = [dwt_f std(D2)];
dwt_f = [dwt_f std(D3)];
dwt_f = [dwt_f std(D4)];
% dwt_f = [dwt_f std(D5)];
% dwt_f = [dwt_f std(D6)];
dwt_f = [dwt_f std(A)];

dwt_f = [dwt_f meanabs(D1)/meanabs(D2)];
dwt_f = [dwt_f meanabs(D2)/meanabs(D3)];
dwt_f = [dwt_f meanabs(D3)/meanabs(D4)];
dwt_f = [dwt_f meanabs(D4)/meanabs(A)];
% dwt_f = [dwt_f meanabs(D5)/meanabs(D6)];
% dwt_f = [dwt_f meanabs(D6)/meanabs(A)];
dwt_f = [dwt_f meanabs(A)/meanabs(D1)];

out = [emd_f dwt_f wpd_f CEE_f];
 
end

