function data=LoadData(Dataset)

    data.x=Dataset(:,:);
    data.t = zeros(size(data.x,1),1);
    
    for i=1:5
       data.t((i-1)*100+1:i*100,1) = i; 
    end
    
    data.nx=size(data.x,2);
    data.nt=size(data.t,2);
    data.nSample=size(data.x,2);

end