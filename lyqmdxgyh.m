function [out] = lyqmdxgyh(in,da,xiao)
    
     a=size(in,2);
     for i=1:a
         temp=in(:,i);
        xiao(i)=min(temp);
        da(i)=max(temp);
        in(:,i)=(temp-xiao(i))/(da(i)-xiao(i));
     end
     out=in;
     
end