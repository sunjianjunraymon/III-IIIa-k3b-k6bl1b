function [mm,da,xiao] = suoyouliezuidazuixiao(datamatrix)
    
     a=size(datamatrix,2);
     for i=1:a
         temp=datamatrix(:,i);
        xiao(i)=min(temp);
        da(i)=max(temp);
        datamatrix(:,i)=(temp-xiao(i))/(da(i)-xiao(i));
     end
     mm=datamatrix;
     
end