function e=ningjucengcijulei(X,Thc)

   %X=[1 22  11  3.5 13 2 21  3  23 12  4  8 0.00002];
    len=size(X,1);
   % X=yiliezuidazuixiao(X);  
    Y2=pdist(X); 
    Z2=linkage(Y2);

  % Thc=0.1;
    A=Z2(:,3)-Thc;
    B=A(A<0);
    len2=size(B,1);
     c=zeros(len2,3);
    
    for i=1:len2
        c(i,1)=i+len;
        c(i,2)=Z2(i,1);
        c(i,3)=Z2(i,2);
    end
      
    f=c;
    for i=1:len2
         for j=2:3
               if f(i,j)>len
                   k=searchcolumn1(f,f(i,j));   
                   n=f(k,2:size(f,2));
                   m=length(find(n)~=0);
             
                   f(i,(j+m):size(f,2)+m-1)=f(i,j+1:size(f,2));  
                 
                   for p=2:m+1
                   f(i,j+p-2)=f(k,p);                                
                   f(k,p)=0;  
                   end
                 
               end
          end
    end
   f(:,find(sum(abs(f),1)==0))=[];
    
   if(largerthanlen(f,len))
     for i=1:len2
         for j=2:size(f,2)
               if f(i,j)>len
                    k=searchcolumn1(f,f(i,j));   
                   n=f(k,2:size(f,2));
                   m=length(find(n)~=0);
             
                    f(i,(j+m):size(f,2)+m-1)=f(i,j+1:size(f,2));  
                 
                   
                   for p=2:m+1
                   f(i,j+p-2)=f(k,p);                                
                   f(k,p)=0;  
                   end  
               end
          end
     end
      f(:,find(sum(abs(f),1)==0))=[];
   end
 
    d=f(:,2:size(f,2));
  
    e=d;
   
    e(all(e==0,2),:) = [];
    
   e(:,find(sum(abs(e),1)==0))=[];
   
   
end   
   


    

