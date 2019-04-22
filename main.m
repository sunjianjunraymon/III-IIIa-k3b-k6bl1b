clear;clc;

% load('k3b_mat\k3b.mat') %360
%  load('k6b_mat\k6b.mat')  %240
load('three data sets\l1b_mat\l1b.mat') %240

label=HDR.Classlabel;
a=find(label==1);
b=find(label==2);
c=find(label==3);
d=find(label==4);
e=[a ; b; c; d];

index=1:240;
cha=setdiff(index, e);

zong=[];
for i=1:30
    zong=[zong randperm(4)];
end

he=[cha' zong'];
label(cha)=zong;

rhi=find(label==2);
fi=find(label==3);
%3.5-5.5Ê±¼ä¶Î
qishi=HDR.TRIG;
qsrh=qishi(rhi);
qsf=qishi(fi);

for i=1:60
    rhd(:,:,i)=s(qsrh+3.5*250+1:qsrh+5.5*250,:);
    fd(:,:,i)=s(qsf+3.5*250+1:qsf+5.5*250,:);   
end

bqrh=label(rhi);

bqf=label(fi);
bqf=ones(60,1);


% save k6bdata rhd fd bqrh bqf
% save k3bdata rhd fd bqrh bqf
% save l1bdata rhd fd bqrh bqf


