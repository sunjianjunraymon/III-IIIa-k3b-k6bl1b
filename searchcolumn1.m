function k=searchcolumn1(c,a)
  k=0;
  for i=1:size(c,1)
     if c(i,1)==a
         k=i;
     end
  end
end