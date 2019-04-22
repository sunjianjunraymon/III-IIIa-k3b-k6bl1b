function [score expand]=MES(seed,deta,seedtemp,train)
    a=seed;
    a(:,a(1,:)==0)=[];  %将一行中0全部除掉
    a=a';
    expand=repmat(a,1,size(train,2));%已经扩增至所有的列
          
    for i=1:size(expand,2)
        he(i)=columnentropy(expand(:,i),i,seedtemp);
    end
    he=he(he>0);
    score=mean(he);
   
    delzero=expand;
    
    while ( score>deta  &&  size(delzero,2)>2  )    
        
        for i=1:size(expand,1)
                temp=expand;
                temp(i,:)=0;
                %以下对temp每列求entropy,再将每列加起来，
               for j=1:size(temp,2)
               %  he1(j)=columnentropy(expand(:,j),j,seedtemp);
                  he2(j)=columnentropy(temp(:,j),j,seedtemp);
               end
               he2=he2(he2>0);
               scorer=mean(he2);
               er(i)=scorer;%没有删除这一行以前的entropy减去删除这一行以后的entropy        
        end
        tempr=score-er;
        [vr, posr]=max(tempr);
              
         for i=1:size(expand,2)
             temp=expand;
             temp(:,i)=0;
              for j=1:size(temp,2)
                 hec(j)=columnentropy(temp(:,j),j,seedtemp); 
              end
               hec=hec(hec>0);
               scorec=mean(hec);
               ec(i)=scorec;
         end
         tempc=score-ec;
         [vc, posc]=max(tempc);
                 
         
         %比较行及列大小，删除较大的。          
         if vr>vc %delete row
            expand(posr,:)=0;
         end
         
         if vr==vc %delete row
            expand(posr,:)=0;
         end
         
         if vr<vc %delete column
            expand(:,posc)=0;
         end
         
          %以下用于求出删除一列或者一行以后的残差得分
           for i=1:size(expand,2)
              he3(i)=columnentropy(expand(:,i),i,seedtemp);
           end
           he3=he3(he3>0); 
           score=mean(he3);
           %把全零列删除
            delzero=expand;
            delzero(:,find(sum(abs(delzero),1)==0))=[];
         
    end
    
      expand (all(expand == 0, 2),:) = [];
      
      if  size(expand,1)<5
            expand=[];
      end
      
      expcopy=expand;
      expcopy (:,all(expcopy == 0, 1)) = [];
%       if size(expcopy,2)>5
%          expand=[]; 
%       end
      
end




%转换思路，expand后每个元素都求出个数，后面缩减后仍是31列，缩的元素变为0