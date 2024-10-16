%% FIGURE 1 PLOT GENERATION
% **NOTE** 1a,c,d as well as the uppermost spike vs DCS pulses raster plot
% & the bottom leftmost autocorrelation in 1b where generated elsewhere.

%% Input folder path, load data

% Specify folder path with data
% example: data_path = '/Users/benrees/Documents/figures_and_data/Figure1';
data_path = extractBefore(mfilename('fullpath'), mfilename); %change if data is in different path

% Specify file name
file_name = 'rodentData_1b.mat';
load(fullfile(data_path,file_name))

%% add helper functions to path
% uses:
%   shadedErrorBar
helper_path = fullfile(extractBefore(data_path, 'Figure 1'), 'helpers');
addpath(genpath(helper_path))

%% FIGURE 1B
%rng(42)
% lfp beta envelope
f1 = figure; 
%f1.Position = [120,445,1280,230];
p(1) = plot(Time,lfp_env,'LineWidth',2,'Color','k'); hold on;
p(2) = plot(Time,t*ones(length(Time),1),'--','LineWidth',2,'Color','r');
P = length(p);
for i = 1:length(PulseTimes)
    p(i + P) = plot([PulseTimes(i) PulseTimes(i)],[0 .005],'LineWidth',2,'Color','r');
end
xlim([1055 1090])
legend(p([1,2]),{'Beta Envelope','Threshold'},'FontSize',13)

% distribution
color = [0 0.4470 0.7410;0.6350 0.0780 0.1840];
l = 2;
SE = std(Pdf,[],1)/sqrt(size(Pdf,2));

f2 = figure; shadedErrorBar(xi,mean(Pdf,1),SE,'lineProps', {'Color',color(1,:),'LineWidth',l})
SE = std(PdfRand,[],1)/sqrt(size(PdfRand,2));
hold on; shadedErrorBar(xi,mean(PdfRand,1),SE,'lineProps', {'Color',color(2,:),'LineWidth',l})
Th = mean(th);
xline(prctile(th,25),':','LineWidth',l)
xline(mean(th),'-','LineWidth',l)
xline(prctile(th,75),'--','LineWidth',l)
set(findall(gcf,'-property','FontSize'),'FontSize',12)
xlabel("Beta Envelope Amplitude (uV)",'FontSize',14)
ylabel("Counts",'FontSize',14)
legend('BT-DCS','Bootstrapped Samples','25% Threshold','Mean Threshold','75% Threshold','FontSize',13)
xlim([0 0.04])
ylim([0 170])

% barplot
f3 = figure;
%f3.Position(3:4) = [750, 500];
xlabels = {'BT-DCS','Bootstrapped Samples'};
xtick = 1:length(xlabels);
y1 = abThresh;
y2 = abThreshRand;
y = [mean(y1),mean(y2)];
lens = [length(y1),length(y2)];
r = cell(length(xtick),1);
for i = 1:length(xtick)
    b = xtick(i)+.23;
    a = xtick(i)-.23;
    rng(1,"twister");
    r{i} = (b-a).*rand(lens(i),1) + a;
end
b = bar(xtick,y); hold on
b.FaceColor = 'flat';
for k = 1:length(y)
    b.CData(k,:) = color(k,:);
end
sz = 30; scatter(r{1},y1,sz,color(1,:)+[.3 .3 .2],'LineWidth',1.5);
scatter(r{2},y2,sz,color(2,:)+[.35 .5 .5],'LineWidth',1.5);
ehigh = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
elow = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
er = errorbar(xtick,y,elow,ehigh);
er.Color = [0 0 0];                            
er.LineStyle = 'none';
er.LineWidth = 1.5;
er.CapSize = 20;
set(findall(gcf,'-property','FontSize'),'FontSize',12)
set(gca,'XTick',xtick,'XTickLabel',xlabels,'FontSize',14);
ylabel("% Pulses Above Threshold",'FontSize',14)

% Spike triggered autocorrelation barplot
f4 = figure;
xlabels = {'Off stim','BT-DCS'};
xtick = 1:length(xlabels);
y1 = betaEntrap(:,1);
y2 = betaEntrap(:,2);
y = [mean(y1),mean(y2)];
lens = [length(y1),length(y2)];
r = cell(length(xtick),1);
for i = 1:length(xtick)
    b = xtick(i)+.23;
    a = xtick(i)-.23;
    rng(1,"twister");
    r{i} = (b-a).*rand(lens(i),1) + a;
end
b = bar(xtick,y); hold on
color = [0 0.4470 0.7410;0.6350 0.0780 0.1840];
b.FaceColor = 'flat';
for k = 1:length(y)
    b.CData(k,:) = color(k,:);
end
sz = 30; scatter(r{1},y1,sz,color(1,:)+[.3 .3 .2],'LineWidth',1.5);
scatter(r{2},y2,sz,color(2,:)+[.35 .5 .5],'LineWidth',1.5);
ehigh = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
elow = [std(y1)/sqrt(length(y1)),std(y2)/sqrt(length(y2))];
er = errorbar(xtick,y,elow,ehigh);
er.Color = [0 0 0];                            
er.LineStyle = 'none';
er.LineWidth = 1.5;
er.CapSize = 20;
set(findall(gcf,'-property','FontSize'),'FontSize',12)
set(gca,'XTick',xtick,'XTickLabel',xlabels,'FontSize',14);
ylabel("Mean Beta Autocorrelation",'FontSize',14)