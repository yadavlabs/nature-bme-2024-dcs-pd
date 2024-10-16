%% EXTENDED DATA FIGURE 2 PLOT GENERATION


%% Input folder path, load data

% Specify folder path with data
% example: data_path = '/Users/benrees/Documents/figures_and_data/';
data_path = extractBefore(mfilename('fullpath'), mfilename); %change if data is in different path

% Specify file name
file_name = 'rodentData_Ext2.mat';
load(fullfile(data_path,file_name))

%% add helper functions to path
% uses:
%   MinVolEllipse
%   Ellipse_plot
%   colormapline
helper_path = fullfile(extractBefore(data_path, 'Extended Data Figure 2'), 'helpers');
addpath(genpath(helper_path))

%% EXTENDED DATA FIGURE 2A

totalInhibFrs = totalInhibFrsRest;
totalExitFrs = totalExitFrsRest;
figure;
color(1,:) = [195/255 195/255 195/255];
color(2,:) = [255/255 179/255 0/255];
xlabels = {'Off Stim';'BT-DCS'};
xtick = 1:length(xlabels);
y1 = totalInhibFrs(1,:);
y2 = totalInhibFrs(2,:);
y = [mean(y1) mean(y2)];
lens = [length(y1),length(y2)];
r = cell(length(xtick),1);
for i = 1:length(xtick)
    b = xtick(i)+.23;
    a = xtick(i)-.23;
    rng(1,"twister");
    r{i} = (b-a).*rand(lens(i),1) + a;
end
subplot(1,2,1); b = bar(xtick,y); hold on
b.FaceColor = 'flat';
for k = 1:length(y)
    b.CData(k,:) = color(k,:);
end
sz = 30; scatter(r{1},y1,sz,color(1,:)-.4,'filled','LineWidth',.75);
scatter(r{2},y2,sz,color(2,:)-[.2 .2 0],'filled','LineWidth',.75);
ehigh = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
elow = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
er = errorbar(xtick,y,elow,ehigh);
er.Color = [0 0 0];                            
er.LineStyle = 'none';
er.LineWidth = 1.5;
er.CapSize = 20;
color(1,:) = [195/255 195/255 195/255];
color(2,:) = [56/255 124/255 78/255];
xlabels = {'Off Stim';'BT-DCS'};
xtick = 1:length(xlabels);
y1 = totalExitFrs(1,:);
y2 = totalExitFrs(2,:);
y = [mean(y1) mean(y2)];
lens = [length(y1),length(y2)];
r = cell(length(xtick),1);
for i = 1:length(xtick)
    b = xtick(i)+.23;
    a = xtick(i)-.23;
    rng(1,"twister");
    r{i} = (b-a).*rand(lens(i),1) + a;
end
set(findall(gcf,'-property','FontSize'),'FontSize',12)
subplot(1,2,2); b = bar(xtick,y); hold on
b.FaceColor = 'flat';
for k = 1:length(y)
    b.CData(k,:) = color(k,:);
end
sz = 30; scatter(r{1},y1,sz,color(1,:)-.4,'filled','LineWidth',.75);
scatter(r{2},y2,sz,color(2,:)-[.15 .2 .2],'filled','LineWidth',.75);
ehigh = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
elow = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
er = errorbar(xtick,y,elow,ehigh);
er.Color = [0 0 0];                            
er.LineStyle = 'none';
er.LineWidth = 1.5;
er.CapSize = 20;
set(findall(gcf,'-property','FontSize'),'FontSize',12)
subplot(1,2,1);
set(gca,'XTick',xtick,'XTickLabel',xlabels,'FontSize',14);
ylabel('Firing Rate (Hz)','FontSize',14)
title('Inhibitory','FontSize',14)
ylim([0 120])
subplot(1,2,2);
set(gca,'XTick',xtick,'XTickLabel',xlabels);
ylabel('Firing Rate (Hz)','FontSize',14)
ylim([0 60])
title('Excitatory','FontSize',14)

%% EXTENDED DATA FIGURE 2B

totalInhibFrs = totalInhibFrsMov;
totalExitFrs = totalExitFrsMov;
figure;
color(1,:) = [195/255 195/255 195/255];
color(2,:) = [255/255 179/255 0/255];
xlabels = {'Off Stim';'BT-DCS'};
xtick = 1:length(xlabels);
y1 = totalInhibFrs(1,:);
y2 = totalInhibFrs(2,:);
y = [mean(y1) mean(y2)];
lens = [length(y1),length(y2)];
r = cell(length(xtick),1);
for i = 1:length(xtick)
    b = xtick(i)+.23;
    a = xtick(i)-.23;
    rng(1,"twister");
    r{i} = (b-a).*rand(lens(i),1) + a;
end
subplot(1,2,1); b = bar(xtick,y); hold on
b.FaceColor = 'flat';
for k = 1:length(y)
    b.CData(k,:) = color(k,:);
end
sz = 30; scatter(r{1},y1,sz,color(1,:)-.4,'filled','LineWidth',.75);
scatter(r{2},y2,sz,color(2,:)-[.2 .2 0],'filled','LineWidth',.75);
ehigh = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
elow = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
er = errorbar(xtick,y,elow,ehigh);
er.Color = [0 0 0];                            
er.LineStyle = 'none';
er.LineWidth = 1.5;
er.CapSize = 20;
set(findall(gcf,'-property','FontSize'),'FontSize',12)
color(1,:) = [195/255 195/255 195/255];
color(2,:) = [56/255 124/255 78/255];
xlabels = {'Off Stim';'BT-DCS'};
xtick = 1:length(xlabels);
y1 = totalExitFrs(1,:);
y2 = totalExitFrs(2,:);
y = [mean(y1) mean(y2)];
lens = [length(y1),length(y2)];
r = cell(length(xtick),1);
for i = 1:length(xtick)
    b = xtick(i)+.23;
    a = xtick(i)-.23;
    rng(1,"twister");
    r{i} = (b-a).*rand(lens(i),1) + a;
end
subplot(1,2,2); b = bar(xtick,y); hold on
b.FaceColor = 'flat';
for k = 1:length(y)
    b.CData(k,:) = color(k,:);
end
sz = 30; scatter(r{1},y1,sz,color(1,:)-.4,'filled','LineWidth',.75);
scatter(r{2},y2,sz,color(2,:)-[.15 .2 .2],'filled','LineWidth',.75);
ehigh = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
elow = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
er = errorbar(xtick,y,elow,ehigh);
er.Color = [0 0 0];                            
er.LineStyle = 'none';
er.LineWidth = 1.5;
er.CapSize = 20;
set(findall(gcf,'-property','FontSize'),'FontSize',12)
subplot(1,2,1);
set(gca,'XTick',xtick,'XTickLabel',xlabels,'FontSize',14);
ylabel('Firing Rate (Hz)','FontSize',14)
title('Inhibitory','FontSize',14)
ylim([0 120])
subplot(1,2,2);
set(gca,'XTick',xtick,'XTickLabel',xlabels);
ylabel('Firing Rate (Hz)','FontSize',14)
ylim([0 60])
title('Excitatory','FontSize',14)

%% EXTENDED DATA FIGURE 2C

Region = 1;
RatPCAMetricsOff = RatPCAMetricsOff_1;
RatPCAMetricsOn = RatPCAMetricsOn_1;
scoreTime1 = scoreTime1_1;
scoreTime2 = scoreTime2_1;
pcaTimePoints = pcaTimePoints_1;

% PCA plot
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
figure; scatter3(scoreTime1(:,1),scoreTime1(:,2),scoreTime1(:,3),'or','filled');
hold on; scatter3(scoreTime2(:,1),scoreTime2(:,2),scoreTime2(:,3),'ob','filled');
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
set(findall(gcf,'-property','FontSize'),'FontSize',12)
xlabel('PC 1','FontSize',14)
ylabel('PC 2','FontSize',14)
zlabel('PC 3','FontSize',14)
arrow([st1x(end-1),st1y(end-1),st1z(end-1)],[st1x(end),st1y(end),st1z(end)])
arrow([st2x(end-1),st2y(end-1),st2z(end-1)],[st2x(end),st2y(end),st2z(end)])
legend({'Off Stim','BT-DCS'},'FontSize',13)
title('Primary Motor Cortex (M1)')
box on

% PCA Metric bargraph comparison
figure;
color(1,:) = [255/255 83/255 83/255];
color(2,:) = [41/255 178/255 255/255];
xlabels = {'Off Stim';'BT-DCS'};
xtick = 1:length(xlabels);
vol1 = [RatPCAMetricsOff(:,1);RatPCAMetricsOff(:,2)];
vol2 = [RatPCAMetricsOn(:,1);RatPCAMetricsOn(:,2)];
y1 = vol1;
y2 = vol2;
y = [mean(y1) mean(y2)];
lens = [length(y1),length(y2)];
r = cell(length(xtick),1);
for i = 1:length(xtick)
    b = xtick(i)+.23;
    a = xtick(i)-.23;
    rng(1,"twister");
    r{i} = (b-a).*rand(lens(i),1) + a;
end
subplot(1,2,1); b = bar(xtick,y); hold on
b.FaceColor = 'flat';
for k = 1:length(y)
    b.CData(k,:) = color(k,:);
end
sz = 30; scatter(r{1},y1,sz,color(1,:)-.2,'filled','LineWidth',1.5);
scatter(r{2},y2,sz,color(2,:)-[.15 .2 .2],'filled','LineWidth',1.5);
ehigh = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
elow = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
er = errorbar(xtick,y,elow,ehigh);
er.Color = [0 0 0];                            
er.LineStyle = 'none';
er.LineWidth = 1.5;
er.CapSize = 20;
ylim([0 180000])
set(findall(gcf,'-property','FontSize'),'FontSize',12)
xlabels = {'Off Stim';'BT-DCS'};
xtick = 1:length(xlabels);
OffPathLen = RatPCAMetricsOff(:,4);
OnPathLen = RatPCAMetricsOn(:,4);
y1 = OffPathLen;
y2 = OnPathLen;
y = [mean(y1) mean(y2)];
lens = [length(y1),length(y2)];
r = cell(length(xtick),1);
for i = 1:length(xtick)
    b = xtick(i)+.23;
    a = xtick(i)-.23;
    rng(1,"twister");
    r{i} = (b-a).*rand(lens(i),1) + a;
end
subplot(1,2,2); b = bar(xtick,y); hold on
b.FaceColor = 'flat';
for k = 1:length(y)
    b.CData(k,:) = color(k,:);
end
sz = 30; scatter(r{1},y1,sz,color(1,:)-.2,'filled','LineWidth',1.5);
scatter(r{2},y2,sz,color(2,:)-[.15 .2 .2],'filled','LineWidth',1.5);
ehigh = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
elow = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
er = errorbar(xtick,y,elow,ehigh);
er.Color = [0 0 0];                            
er.LineStyle = 'none';
er.LineWidth = 1.5;
er.CapSize = 20;
ylim([0 800])
set(findall(gcf,'-property','FontSize'),'FontSize',12)
subplot(1,2,1);
set(gca,'XTick',xtick,'XTickLabel',xlabels,'FontSize',14);
title('Average Ellipsoid  Volumes','FontSize',14)
ylabel('Volume (a.u.)')
subplot(1,2,2);
set(gca,'XTick',xtick,'XTickLabel',xlabels,'FontSize',14);
title('Average Path Length','FontSize',14)
ylabel('Length (a.u.)')      


%% EXTENDED DATA FIGURE 2D

Region = 2;
RatPCAMetricsOff = RatPCAMetricsOff_2;
RatPCAMetricsOn = RatPCAMetricsOn_2;
scoreTime1 = scoreTime1_2;
scoreTime2 = scoreTime2_2;
pcaTimePoints = pcaTimePoints_2;

% PCA plot
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
figure; scatter3(scoreTime1(:,1),scoreTime1(:,2),scoreTime1(:,3),'or','filled');
hold on; scatter3(scoreTime2(:,1),scoreTime2(:,2),scoreTime2(:,3),'ob','filled');
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
set(findall(gcf,'-property','FontSize'),'FontSize',12)
xlabel('PC 1','FontSize',14)
ylabel('PC 2','FontSize',14)
zlabel('PC 3','FontSize',14)
arrow([st1x(end-1),st1y(end-1),st1z(end-1)],[st1x(end),st1y(end),st1z(end)])
arrow([st2x(end-1),st2y(end-1),st2z(end-1)],[st2x(end),st2y(end),st2z(end)])
legend({'Off Stim','BT-DCS'},'FontSize',13)
title('Dorsolateral Striatum (STR)')
box on

% PCA Metric bargraph comparison
figure;
color(1,:) = [255/255 83/255 83/255];
color(2,:) = [41/255 178/255 255/255];
xlabels = {'Off Stim';'BT-DCS'};
xtick = 1:length(xlabels);
vol1 = [RatPCAMetricsOff(:,1);RatPCAMetricsOff(:,2)];
vol2 = [RatPCAMetricsOn(:,1);RatPCAMetricsOn(:,2)];
y1 = vol1;
y2 = vol2;
y = [mean(y1) mean(y2)];
lens = [length(y1),length(y2)];
r = cell(length(xtick),1);
for i = 1:length(xtick)
    b = xtick(i)+.23;
    a = xtick(i)-.23;
    rng(1,"twister");
    r{i} = (b-a).*rand(lens(i),1) + a;
end
subplot(1,2,1); b = bar(xtick,y); hold on
b.FaceColor = 'flat';
for k = 1:length(y)
    b.CData(k,:) = color(k,:);
end
sz = 30; scatter(r{1},y1,sz,color(1,:)-.2,'filled','LineWidth',1.5);
scatter(r{2},y2,sz,color(2,:)-[.15 .2 .2],'filled','LineWidth',1.5);
ehigh = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
elow = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
er = errorbar(xtick,y,elow,ehigh);
er.Color = [0 0 0];                            
er.LineStyle = 'none';
er.LineWidth = 1.5;
er.CapSize = 20;
ylim([0 180000])
set(findall(gcf,'-property','FontSize'),'FontSize',12)
xlabels = {'Off Stim';'BT-DCS'};
xtick = 1:length(xlabels);
OffPathLen = RatPCAMetricsOff(:,4);
OnPathLen = RatPCAMetricsOn(:,4);
y1 = OffPathLen;
y2 = OnPathLen;
y = [mean(y1) mean(y2)];
lens = [length(y1),length(y2)];
r = cell(length(xtick),1);
for i = 1:length(xtick)
    b = xtick(i)+.23;
    a = xtick(i)-.23;
    rng(1,"twister");
    r{i} = (b-a).*rand(lens(i),1) + a;
end
subplot(1,2,2); b = bar(xtick,y); hold on
b.FaceColor = 'flat';
for k = 1:length(y)
    b.CData(k,:) = color(k,:);
end
sz = 30; scatter(r{1},y1,sz,color(1,:)-.2,'filled','LineWidth',1.5);
scatter(r{2},y2,sz,color(2,:)-[.15 .2 .2],'filled','LineWidth',1.5);
ehigh = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
elow = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
er = errorbar(xtick,y,elow,ehigh);
er.Color = [0 0 0];                            
er.LineStyle = 'none';
er.LineWidth = 1.5;
er.CapSize = 20;
ylim([0 800])
set(findall(gcf,'-property','FontSize'),'FontSize',12)
subplot(1,2,1);
set(gca,'XTick',xtick,'XTickLabel',xlabels,'FontSize',14);
title('Average Ellipsoid  Volumes','FontSize',14)
ylabel('Volume (a.u.)')
subplot(1,2,2);
set(gca,'XTick',xtick,'XTickLabel',xlabels,'FontSize',14);
title('Average Path Length','FontSize',14)
ylabel('Length (a.u.)')