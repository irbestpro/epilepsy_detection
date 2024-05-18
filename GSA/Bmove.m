%This function updates the velocity and position of agents.
function [X,V]=Bmove(X,a,V)
%movement.

    [N,n]=size(X);
    V=rand(N,n).*V+a;
    S=abs(tanh(V)); %eq. 13.
    temp=rand(N,n)<S;
    moving=find(temp==1);
    X(moving)=~X(moving);   %eq. 14     

end
