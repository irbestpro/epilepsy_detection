function [M]=massCalculation(fit,min_flag)

Fmax=max(fit); Fmin=min(fit);
[i N]=size(fit);

if Fmax==Fmin
   M=ones(N,1);
else
    
   if min_flag==1 
      best=Fmin;worst=Fmax; % minimization
   else 
      best=Fmax;worst=Fmin; % maximization
   end
  
   M=(fit-worst)./(best-worst); %eq.9,
   
end

M=M./sum(M); %eq. 10.

end
