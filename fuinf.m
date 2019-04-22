function out=fuinf(rulel,ruler,in)
%第一步是求出左右运动
%the expression of rule is as follows: If A1 is a1 and A2 is a2 .....,Then 
%小大再切割输出函数

for i=1:size(rulel,1)
   for j=1:size(rulel,2)-1
       x=rulel(i,j);
       if x>0
            S=exp(-power(x,2)/(2*power(0.15,2)));
            M=exp(-power(x-0.5,2)/(2*power(0.15,2)));
            L=exp(-power(x-1,2)/(2*power(0.15,2)));
            temp=[S M L];
            [v,p]=max(temp);
            rulel(i,j)=p; 
       end
   end       
end

for i=1:size(rulel,1)
   for j=size(rulel,2)
       x=rulel(i,j);
       if x>0
            S=exp(-power(x-1,2)/(2*power(0.4,2)));
            L=exp(-power(x-2,2)/(2*power(0.4,2)));
            temp=[S L];
            [v,p]=max(temp);
            rulel(i,j)=p; 
       end
   end       
end

for i=1:size(ruler,1)
   for j=1:size(ruler,2)-1
       x=ruler(i,j);
       if x>0
            S=exp(-power(x,2)/(2*power(0.15,2)));
            M=exp(-power(x-0.5,2)/(2*power(0.15,2)));
            L=exp(-power(x-1,2)/(2*power(0.15,2)));
            temp=[S M L];
            [v,p]=max(temp);
            ruler(i,j)=p; 
       end
   end       
end

for i=1:size(ruler,1)
   for j=size(ruler,2)
       x=ruler(i,j);
       if x>0
            S=exp(-power(x-1,2)/(2*power(0.4,2)));
            L=exp(-power(x-2,2)/(2*power(0.4,2)));
            temp=[S L];
            [v,p]=max(temp);
            ruler(i,j)=p; 
       end
   end       
end

la=[];
for i=1:size(rulel,1)
    ma=[];
       for j=1:size(rulel,2)-1
           if rulel(i,j)>0
                    x=rulel(i,j);           
                   if x==1
                       ms=exp(-power(in(j),2)/(2*power(0.15,2)));
                   elseif x==2
                       ms=exp(-power(in(j)-0.5,2)/(2*power(0.15,2)));
                   elseif x==3
                       ms=exp(-power(in(j)-1,2)/(2*power(0.15,2)));
                   else
                       ms=1;
                   end
                   ma=[ma ms];
           end          
       end
      la=[la min(ma)];
end
lm=max(la);

ra=[];
for i=1:size(ruler,1)
    ma=[];
       for j=1:size(ruler,2)-1
           if ruler(i,j)>0
                    x=ruler(i,j);           
                   if x==1
                       ms=exp(-power(in(j),2)/(2*power(0.15,2)));
                   elseif x==2
                       ms=exp(-power(in(j)-0.5,2)/(2*power(0.15,2)));
                   elseif x==3
                       ms=exp(-power(in(j)-1,2)/(2*power(0.15,2)));
                   else
                       ms=1;
                   end
                   ma=[ma ms];
           end          
       end
      ra=[ra min(ma)];
end
rm=max(ra);

fun1=@(x) exp(-power(x-1,2)/(2*power(0.4,2)));
fun2=@(x) exp(-power(x-2,2)/(2*power(0.4,2)));

coef1=integral(fun1,1,2);
coef2=integral(fun2,1,2);

syms t;
f1=exp(-power(t-1,2)/(2*power(0.4,2)))-coef1;
z1=double(solve(f1));
for i=1:length(z1)
    if 1<=z1(i)<=1.5
        c1=z1(i);
    end
end
c2=3-c1;

out=(rm*c2+lm*c1)/(lm+rm);
end