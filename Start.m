%
'''These Codes Are Written By Mehdi Touyserkani
    Email Address: Ir_Bestpro@yahoo.com
    Website: Https://www.Ir-Bestpro.com
 '''
%

function [out] = Start()

warning 'off'
clc;

%____Load Extracted Feature From FFT Algorithm______

addpath './dataSets';
addpath './Wavelets';
addpath './Last';
addpath './Classification';

Classes = ['A' 'B' 'C' 'D' 'E'];
Inputs = [];
Targets = [];

% %___Collects Data____________

LL = 4097;

for i=1:numel(Classes)
   Data = csvread([Classes(i) '.csv']);
   Inputs = [Inputs;Data];
   Targets = [Targets;ones(size(Data,1),1)*i];
end

%_____MSPCA__Denoising Techniques_________

level = 4; % Four Level Decomposition
wname = 'db4';
npc = 'heur';
Inputs = Inputs';
[~, ~, npc] = wmspca(Inputs(:,:),level,wname,npc);

npc(1:3) = zeros(1,3);
[denoised_signal, ~, ~] = wmspca(Inputs(:,:),level,wname,npc);

denoised_signal = denoised_signal';

%_____Extract Features_______________

wavelet_Name = 'db4'; % According To Paper
levels = 4; % For Dwt
features = zeros(size(denoised_signal,1),222);% 48+42+96 , 48+30+96 = 174

for i=1:size(denoised_signal,1)
     
    i
    %_____Empirical Decomposition Method________
 
    temp = emd(denoised_signal(i,:));
    
    %_____WPD Decomposition Method________
    
%     [w1,w2] = dwt(denoised_signal(i,:),wavelet_Name);
%     [w3,w4] = dwt(w1,wavelet_Name);
%     [w5,w6] = dwt(w2,wavelet_Name);
%     
%     [w7,w8] = dwt(w3,wavelet_Name);
%     [w9,w10] = dwt(w4,wavelet_Name);
%     [w11,w12] = dwt(w5,wavelet_Name);
%     [w13,w14] = dwt(w6,wavelet_Name);
%     
%     [wp1,wp2] = dwt(w7,wavelet_Name);
%     [wp3,wp4] = dwt(w8,wavelet_Name);
%     [wp5,wp6] = dwt(w9,wavelet_Name);
%     [wp7,wp8] = dwt(w10,wavelet_Name);
%     [wp9,wp10] = dwt(w11,wavelet_Name);
%     [wp11,wp12] = dwt(w12,wavelet_Name);
%     [wp13,wp14] = dwt(w13,wavelet_Name);
%     [wp15,wp16] = dwt(w14,wavelet_Name);

     wpt = wpdec(denoised_signal(i,:),levels,'db4');
     
     [wp1] = wpcoef(wpt,[4 0]);
     [wp2] = wpcoef(wpt,[4 1]);
     [wp3] = wpcoef(wpt,[4 2]);
     [wp4] = wpcoef(wpt,[4 3]);
     [wp5] = wpcoef(wpt,[4 4]);
     [wp6] = wpcoef(wpt,[4 5]);
     [wp7] = wpcoef(wpt,[4 6]);
     [wp8] = wpcoef(wpt,[4 7]);
     [wp9] = wpcoef(wpt,[4 8]);
     [wp10] = wpcoef(wpt,[4 9]);
     [wp11] = wpcoef(wpt,[4 10]);
     [wp12] = wpcoef(wpt,[4 11]);
     [wp13] = wpcoef(wpt,[4 12]);
     [wp14] = wpcoef(wpt,[4 13]);
     [wp15] = wpcoef(wpt,[4 14]);
     [wp16] = wpcoef(wpt,[4 15]);
         
    %___DWT Decomposition___________
    
    freq = 173.61 * denoised_signal(1:(LL/2))/LL;
  
    [C,L] = wavedec(freq,levels,wavelet_Name); %Mother Wavelet = db-4 And Level = 6 , k+1 Feature size
    
    D1 = detcoef(C,L,1);
    D2 = detcoef(C,L,2);
    D3 = detcoef(C,L,3);
    D4 = detcoef(C,L,4);
%     D5 = detcoef(C,L,5);
%     D6 = detcoef(C,L,6);
    A = appcoef(C,L,wavelet_Name,level);
    
    D = [D1 D2 D3 D4 A];
    
    %___CEEMDAN________________
    
    [CEE ~] = Ceemdan(denoised_signal(i,:),.2,100,100); 

    %___Statistical Features___
    
    features(i,:) = Statistical_Features(temp,[wp1;wp2;wp3;wp4;wp5;wp6;wp7;wp8;wp9;wp10;wp11;wp12;wp13;wp14;wp15;wp16],D,CEE);
    features14(i,:) = Statistical_Features14(temp,[wp1;wp2;wp3;wp4;wp5;wp6;wp7;wp8;wp9;wp10;wp11;wp12;wp13;wp14;wp15;wp16],D,CEE);
    features1256(i,:) = Statistical_Features1256(temp,[wp1;wp2;wp3;wp4;wp5;wp6;wp7;wp8;wp9;wp10;wp11;wp12;wp13;wp14;wp15;wp16],D,CEE);   
    
end

save('Features','features');
save('Features14','features14');
save('Features1256','features1256');


end

