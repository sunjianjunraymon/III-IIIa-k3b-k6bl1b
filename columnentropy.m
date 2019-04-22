function he = columnentropy( column ,k,seedtemp)

    %如果一列全为0，怎么处理？
    he=0;
    if length(find(column==0))~=size(column,1)
                   %column一定要是列向量 
                    posclu=zeros(1,size(column,1));
                     temp=seedtemp(k).real;
                    for i=1:size(column,1)             
                        num=0;
                        for m=1:size(temp,1) %行数
                            for n=1:size(temp,2) %列数
                                %这里有错误，因为凝聚层次聚类的时候有些删除了，删除的每个自成一类
                               if temp(m,n)== column(i,1)
                                   posclu(1,i)=m;
                                   num=1;
                               end
                             end
                        end

                        if num==0
                            posclu(1,i)=(i+2000);
                        end

                    end
                    x=posclu';

                    %x一定要是列向量 
                    x=sort(x);
                    d=diff([x;max(x)+1]);
                    count = diff(find([1;d])) ;
                    y =[x(find(d)) count];

                    lengthzero=0;

                    %如果删除一行，对应的如121会人为设置成0，为0的不参与计算
                    if y(1,1)==0
                        lengthzero=y(1,2);
                        y=y(2:end,:);
                    end

                    tempentropy=(y(:,2)/(size(column,1)-lengthzero));

                    he=0;
                    for i=1:size(y,1)                     
                        tempc=tempentropy(i,1);
                        he=he-tempc*log2(tempc);
                    end

    end   
    if he<0
        he
    end
  
end

