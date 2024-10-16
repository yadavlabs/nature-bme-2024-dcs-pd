%% FIGURE 4 PLOT GENERATION
% **NOTE** 4a-d as well as the violin plots in e-h (bottom) were generated in
% graphpad. Only power spectra is generated here(e-h, top).

%% Input folder path, load data

% Specify folder path with data
% example: data_path = '/Users/benrees/Documents/figures_and_data/';
data_path = extractBefore(mfilename('fullpath'), mfilename); %change if data is in different path

% Specify file name
file_name = 'rodentData_4.mat';
load(fullfile(data_path,file_name))

%% add helper functions to path
% uses:
%   shadedErrorBar
helper_path = fullfile(extractBefore(data_path, 'Figure 4'), 'helpers');
addpath(genpath(helper_path))

%% FIGURE 4E
regions = {'M1L','M1R','STL','STR'};
region = [1 2 3 4 5]; % 'M1L'/'M1R'/'STL'/'STR'/Aggregated
r = 1;
offPow = offPow1;
openPow = openPow1;
closedPow = closedPow1;
smallFont = 14;
bigFont = 14;
figure; hold on; color = [127/255 127/255 127/255;177/255 0 237/255;0 228/255 124/255];
avgPower = mean(offPow,2);
SE = std(offPow,[],2)/sqrt(size(offPow,1));
shadedErrorBar(Wi,avgPower,SE,'lineProps',{'Color',color(1,:)})
avgPower = mean(openPow,2);
SE = std(openPow,[],2)/sqrt(size(openPow,1));
shadedErrorBar(Wi,avgPower,SE,'lineProps',{'Color',color(2,:)})
avgPower = mean(closedPow,2);
SE = std(closedPow,[],2)/sqrt(size(closedPow,1));
shadedErrorBar(Wi,avgPower,SE,'lineProps',{'Color',color(3,:)})
xlim([10 25])
ylim([-59 -49])
set(findall(gcf,'-property','FontSize'),'FontSize',12)
xlabel('Frequency (Hz)','FontSize',smallFont)
ylabel('Power (dB)','FontSize',smallFont)
lgd = legend('Off Stim','C-DCS','BT-DCS','FontSize',13);
title(['Beta Frequency Range Power Spectrum: ',regions{r}],'FontSize',bigFont)

%% FIGURE 4F

regions = {'M1L','M1R','STL','STR'};
region = [1 2 3 4 5]; % 'M1L'/'M1R'/'STL'/'STR'/Aggregated
r = 2;
offPow = offPow2;
openPow = openPow2;
closedPow = closedPow2;
smallFont = 14;
bigFont = 14;
figure; hold on; color = [127/255 127/255 127/255;177/255 0 237/255;0 228/255 124/255];
avgPower = mean(offPow,2);
SE = std(offPow,[],2)/sqrt(size(offPow,1));
shadedErrorBar(Wi,avgPower,SE,'lineProps',{'Color',color(1,:)})
avgPower = mean(openPow,2);
SE = std(openPow,[],2)/sqrt(size(openPow,1));
shadedErrorBar(Wi,avgPower,SE,'lineProps',{'Color',color(2,:)})
avgPower = mean(closedPow,2);
SE = std(closedPow,[],2)/sqrt(size(closedPow,1));
shadedErrorBar(Wi,avgPower,SE,'lineProps',{'Color',color(3,:)})
xlim([10 25])
ylim([-59 -49])
set(findall(gcf,'-property','FontSize'),'FontSize',12)
xlabel('Frequency (Hz)','FontSize',smallFont)
ylabel('Power (dB)','FontSize',smallFont)
lgd = legend('Off Stim','C-DCS','BT-DCS','FontSize',13);
title(['Beta Frequency Range Power Spectrum: ',regions{r}],'FontSize',bigFont)

%% FIGURE 4G

regions = {'M1L','M1R','STL','STR'};
region = [1 2 3 4 5]; % 'M1L'/'M1R'/'STL'/'STR'/Aggregated
r = 3;
offPow = offPow3;
openPow = openPow3;
closedPow = closedPow3;
smallFont = 14;
bigFont = 14;
figure; hold on; color = [127/255 127/255 127/255;177/255 0 237/255;0 228/255 124/255];
avgPower = mean(offPow,2);
SE = std(offPow,[],2)/sqrt(size(offPow,1));
shadedErrorBar(Wi,avgPower,SE,'lineProps',{'Color',color(1,:)})
avgPower = mean(openPow,2);
SE = std(openPow,[],2)/sqrt(size(openPow,1));
shadedErrorBar(Wi,avgPower,SE,'lineProps',{'Color',color(2,:)})
avgPower = mean(closedPow,2);
SE = std(closedPow,[],2)/sqrt(size(closedPow,1));
shadedErrorBar(Wi,avgPower,SE,'lineProps',{'Color',color(3,:)})
xlim([10 25])
ylim([-59 -49])
set(findall(gcf,'-property','FontSize'),'FontSize',12)
xlabel('Frequency (Hz)','FontSize',smallFont)
ylabel('Power (dB)','FontSize',smallFont)
lgd = legend('Off Stim','C-DCS','BT-DCS','FontSize',13);
title(['Beta Frequency Range Power Spectrum: ',regions{r}],'FontSize',bigFont)

%% FIGURE 4H

regions = {'M1L','M1R','STL','STR'};
region = [1 2 3 4 5]; % 'M1L'/'M1R'/'STL'/'STR'/Aggregated
r = 4;
offPow = offPow4;
openPow = openPow4;
closedPow = closedPow4;
smallFont = 14;
bigFont = 14;
figure; hold on; color = [127/255 127/255 127/255;177/255 0 237/255;0 228/255 124/255];
avgPower = mean(offPow,2);
SE = std(offPow,[],2)/sqrt(size(offPow,1));
shadedErrorBar(Wi,avgPower,SE,'lineProps',{'Color',color(1,:)})
avgPower = mean(openPow,2);
SE = std(openPow,[],2)/sqrt(size(openPow,1));
shadedErrorBar(Wi,avgPower,SE,'lineProps',{'Color',color(2,:)})
avgPower = mean(closedPow,2);
SE = std(closedPow,[],2)/sqrt(size(closedPow,1));
shadedErrorBar(Wi,avgPower,SE,'lineProps',{'Color',color(3,:)})
xlim([10 25])
ylim([-59 -49])
set(findall(gcf,'-property','FontSize'),'FontSize',12)
xlabel('Frequency (Hz)','FontSize',smallFont)
ylabel('Power (dB)','FontSize',smallFont)
lgd = legend('Off Stim','C-DCS','BT-DCS','FontSize',13);
title(['Beta Frequency Range Power Spectrum: ',regions{r}],'FontSize',bigFont)