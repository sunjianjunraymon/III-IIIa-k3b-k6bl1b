clear all;close all;clc;
sys=newfis('FLC');

sys=addvar(sys,'input','FV',[0 1]);
sys=addmf(sys,'input',1,'Small','gaussmf',[0.15 0]);
sys=addmf(sys,'input',1,'Medium','gaussmf',[0.15 0.5]);
sys=addmf(sys,'input',1,'Large','gaussmf',[0.15 1]);
plotmf(sys,'input',1);title('Input membership function');

% sys=addvar(sys,'input','IR',[-18 20]);
% sys=addmf(sys,'input',2,'B1','trapmf',[-20 -18 -14 -1]);
% sys=addmf(sys,'input',2,'B2','trimf',[-14 0 14]);
% sys=addmf(sys,'input',2,'B3','trapmf',[1 14 20 25]);
% figure; 
% plotmf(sys,'input',2);title('Interference Ratio');
% 
% sys=addvar(sys,'input','RSSI',[-90 -70]);
% sys=addmf(sys,'input',3,'C1','trapmf',[-95 -90 -85 -82]);
% sys=addmf(sys,'input',3,'C2','trimf',[-85 -80 -75]);
% sys=addmf(sys,'input',3,'C3','trapmf',[-78 -75 -70 -65]);
% figure;
% plotmf(sys,'input',3);title('RSSI');

sys=addvar(sys,'output','Output ',[1 2]);
sys=addmf(sys,'output',1,'Small','gaussmf',[0.4 1]);
sys=addmf(sys,'output',1,'Large','gaussmf',[0.4 2]);
figure;
plotmf(sys,'output',1);title('Output membership function');

% rule=[1 1 1 1 1 1 ;2 2 2 2 1 1;3 3 3 1 1 1;3 1 3 3 1 1];
% sys=addrule(sys,rule);
% figure;
% plotfis(sys);
% APCV=evalfis([20 -18 -80],sys)