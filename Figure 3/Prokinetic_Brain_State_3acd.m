%% FIGURE 3 PLOT GENERATION
% **NOTE** 3b & 3e were generated in graphpad. All other figure 3 plots are
% generated here (a,c,d).

%% Input folder path, load data

% Specify folder path with data
% example: data_path = '/Users/benrees/Documents/figures_and_data/ExtendedDataFigure4';
data_path = extractBefore(mfilename('fullpath'), mfilename); %change if data is in different path

% Specify file name
file_name = 'rodentData_3.mat';
load(fullfile(data_path,file_name))

%% add helper functions to path
% uses:
%   shadedErrorBar
%   MinVolEllipse
%   Ellipse_plot
%   colormapline
helper_path = fullfile(extractBefore(data_path, 'Figure 3'), 'helpers');
addpath(genpath(helper_path))

%% FIGURE 3A
figure;
names = {'Fox','Hyena','Lion','Puma','Spider'};
for i = 1:length(names)
    frs = ratAggFR{i};
    frLabs = ratAggFRLabel{i};
    xl = linspace(0,max(max(frs)));
    yl = linspace(0,max(max(frs)));
    normalInd = find(frLabs == 0);
    inhibInd = find(frLabs == 1);
    exitInd = find(frLabs == 2);
    subplot(2,3,i); scatter(frs(1,normalInd),frs(2,normalInd),[],'k','filled')
    hold on; scatter(frs(1,inhibInd),frs(2,inhibInd),[],[255/255 179/255 0/255],'filled');
    scatter(frs(1,exitInd),frs(2,exitInd),[],[56/255 124/255 78/255],'filled'); plot(xl,yl,'k')
end
for i = 1:length(names)
    subplot(2,3,i);
    set(findall(gcf,'-property','FontSize'),'FontSize',12)
    title(['Rat ' num2str(i)],'FontSize',14)
    xlabel('Off Stimulation FR (Hz)','FontSize',14)
    ylabel('Closed-Loop Stimulation FR (Hz)','FontSize',14)
end

%% FIGURE 3C

locoWinFRs = locoWinFRsExample;
speed = speedExample;
speedT = [-2.875:5.75/(length(speed)-1):2.875];
SE = std(speed)/sqrt(size(speed,1));

figure; subplot(3,1,1)
shadedErrorBar(speedT,mean(speed),SE);
xline(0,'-r','LineWidth',1.5);
xlim([-2.875 2.875])
SE = std(locoWinFRs)/sqrt(size(locoWinFRs,1));
locoWinFRsSmooth = spline(timeBins,movmean(mean(locoWinFRs),6),tSmooth);
SESmooth = spline(timeBins,movmean(SE,6),tSmooth);

subplot(3,1,3)
shadedErrorBar(tSmooth,locoWinFRsSmooth,SESmooth);
xline(0,'-r','LineWidth',1.5);
xlim([-2.875 2.875])

locoWinFRs = locoWinFRsExample2;
SE = std(locoWinFRs)/sqrt(size(locoWinFRs,1));
locoWinFRsSmooth = spline(timeBins,movmean(mean(locoWinFRs),6),tSmooth);
SESmooth = spline(timeBins,movmean(SE,6),tSmooth);
subplot(3,1,2)
shadedErrorBar(tSmooth,locoWinFRsSmooth,SESmooth);
xline(0,'-r','LineWidth',1.5);
xlim([-2.875 2.875])
subplot(3,1,1)
set(findall(gcf,'-property','FontSize'),'FontSize',12)
title('Locomotion Initiation','FontSize',14)
xlabel('Time (s)','FontSize',14)
ylabel('Speed (cm/s)','FontSize',14)
subplot(3,1,2)
set(findall(gcf,'-property','FontSize'),'FontSize',12)
title('Neuron 47','FontSize',14)
xlabel('Time (s)','FontSize',14)
ylabel('Firing Rate (Hz)','FontSize',14)
subplot(3,1,3)
set(findall(gcf,'-property','FontSize'),'FontSize',12)
title('Neuron 38','FontSize',14)
xlabel('Time (s)','FontSize',14)
ylabel('Firing Rate (Hz)','FontSize',14)

%% FIGURE 3D

scoreTime1Rest = scoreTime1(1:pcaTimePoints,1:3);
scoreTime1Mov = scoreTime1(pcaTimePoints+4:end,1:3);
scoreTime2Rest = scoreTime2(1:pcaTimePoints,1:3);
scoreTime2Mov = scoreTime2(pcaTimePoints+4:end,1:3);    
metrics = [];
darkred = [100, 0, 0]/255;    % Init color
lightred = [255, 0, 0]/255;     % final color
colorMapR = [linspace(darkred(1),lightred(1),256)', linspace(darkred(2),lightred(2),256)', linspace(darkred(3),lightred(3),256)'];
darkblue = [0, 60, 100]/255;    % Init color
lightblue = [0, 150, 255]/255;
colorMapB = [linspace(darkblue(1),lightblue(1),256)', linspace(darkblue(2),lightblue(2),256)', linspace(darkblue(3),lightblue(3),256)'];
figure; scatter3(scoreTime1(:,1),scoreTime1(:,2),scoreTime1(:,3),'or','filled','LineWidth',1.5);
hold on; scatter3(scoreTime2(:,1),scoreTime2(:,2),scoreTime2(:,3),'ob','filled','LineWidth',1.5);

thr = .01;
[A,c1] = MinVolEllipse(scoreTime1Rest',thr);
Ellipse_plot(A,c1,'#FF5353')
[~, Q, ~] = svd(A);
aa = 1/sqrt(Q(1,1));
bb = 1/sqrt(Q(2,2));
cc = 1/sqrt(Q(3,3));
metrics(1,1) = 4/3*pi*aa*bb*cc;
[A,c2] = MinVolEllipse(scoreTime1Mov',thr);
hold on; Ellipse_plot(A,c2,'#FF5353')
[~, Q, ~] = svd(A);
aa = 1/sqrt(Q(1,1));
bb = 1/sqrt(Q(2,2));
cc = 1/sqrt(Q(3,3));
metrics(1,2) = 4/3*pi*aa*bb*cc;
metrics(1,3) = sqrt((c1(1)-c2(1)).^2+(c1(2)-c2(2)).^2+(c1(3)-c2(3)).^2);
[A,c1] = MinVolEllipse(scoreTime2Rest',thr);
Ellipse_plot(A,c1,'#29B2FF')
[~, Q, ~] = svd(A);
aa = 1/sqrt(Q(1,1));
bb = 1/sqrt(Q(2,2));
cc = 1/sqrt(Q(3,3));
metrics(2,1) = 4/3*pi*aa*bb*cc;
[A,c2] = MinVolEllipse(scoreTime2Mov',thr);
Ellipse_plot(A,c2,'#29B2FF')
[~, Q, ~] = svd(A);
aa = 1/sqrt(Q(1,1));
bb = 1/sqrt(Q(2,2));
cc = 1/sqrt(Q(3,3));
metrics(2,2) = 4/3*pi*aa*bb*cc;
metrics(2,3) = sqrt((c1(1)-c2(1)).^2+(c1(2)-c2(2)).^2+(c1(3)-c2(3)).^2);
alpha 0.5
interpPoints = 1000;
win = 2;
s1 = [];
s2 = [];
for i = 1:pcaTimePoints*2/win
    s1 = [s1; mean(scoreTime1(win*(i-1)+1:win*i,:))];
    s2 = [s2; mean(scoreTime2(win*(i-1)+1:win*i,:))];
end
scoreTime1 = s1;
scoreTime2 = s2;
st1 = [scoreTime1(:,1),scoreTime1(:,2),scoreTime1(:,3)];
st1t = [0;cumsum(sqrt(diff(st1(:,1)).^2+diff(st1(:,2)).^2+diff(st1(:,3)).^2))];
st1t = st1t/st1t(end);
st1ti = linspace(0,1,interpPoints);
st1x = spline(st1t,st1(:,1),st1ti);
st1y = spline(st1t,st1(:,2),st1ti);
st1z = spline(st1t,st1(:,3),st1ti);
st2 = [scoreTime2(:,1),scoreTime2(:,2),scoreTime2(:,3)];
st2t = [0;cumsum(sqrt(diff(st2(:,1)).^2+diff(st2(:,2)).^2+diff(st2(:,3)).^2))];
st2t = st2t/st2t(end);
st2ti = linspace(0,1,interpPoints);
st2x = spline(st2t,st2(:,1),st2ti);
st2y = spline(st2t,st2(:,2),st2ti);
st2z = spline(st2t,st2(:,3),st2ti);
colormapline(st1x,st1y,st1z,colorMapR);
md = length(st1x)/2+1;
colormapline(st2x,st2y,st2z,colorMapB);
xlabel('PC 1','FontSize',14)
ylabel('PC 2','FontSize',14)
zlabel('PC 3','FontSize',14)
arrow([st1x(end-1),st1y(end-1),st1z(end-1)],[st1x(end),st1y(end),st1z(end)])
arrow([st2x(end-1),st2y(end-1),st2z(end-1)],[st2x(end),st2y(end),st2z(end)])
legend({'Off Stim','BT-DCS'},'FontSize',13)
box on