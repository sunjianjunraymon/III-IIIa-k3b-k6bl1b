function x=largerthanlen(f,len)
   x=false;
   for i=1:size(f,1)
      for j=1:size(f,2)
          if f(i,j)>len
              x=true;             
          end
   end
end