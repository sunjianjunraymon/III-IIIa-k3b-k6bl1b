function out=fitness(in1,in2,T)
   for i=1:length(in1)
       if in1(i)<T
           in1(i)=1;
       else
           in1(i)=2;
       end
   end
   cha=in1-in2;
   out= length(find(cha==0)) /length(in1);   
end