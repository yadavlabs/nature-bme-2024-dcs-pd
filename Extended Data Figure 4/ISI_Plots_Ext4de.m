
%% Plots for Extended Data Figure 4d and e
% plotting stimulation frequency and ISI CV

%% load data
data_path = extractBefore(mfilename('fullpath'), mfilename); %change if data is in different path

% Specify file name
file_name = 'rodentData_Ext4de.mat';
load(fullfile(data_path,file_name))

%% add helper functions to path
% uses:
%   rgb
helper_path = fullfile(extractBefore(data_path, 'Extended Data Figure 4'), 'helpers');
addpath(genpath(helper_path))

%% arrays for bar plots
array_len = length(data) + 1;
me_tot = zeros(array_len, 1);
sem_tot = zeros(array_len, 1);
m_cv_tot = zeros(array_len, 1);
sem_cv_tot = zeros(array_len, 1);

me_tot(1) = 100;
sem_tot(1) = 0;
m_cv_tot(1) = 0;
sem_cv_tot(1) = 0;

for i = 1:length(data)
    me_tot(i+1) = data(i).isi(1);
    sem_tot(i+1) = data(i).isi(2);
    m_cv_tot(i+1) = data(i).isi(3);
    sem_cv_tot(i+1) = data(i).isi(4);
end

xtick = 1:length(me_tot);

%% plots
c1 = [156/255 73/255 232/255];
c2 = [16/255 219/255 177/255];

ed =rgb('Black');
colors=[c1;c2;c2;c2;c2;c2;c2];
label_name = {'C-DCS', 'BT-DCS-Rat1', 'BT-DCS-Rat 2', 'BT-DCS-Rat 3', 'BT-DCS-Rat 4', 'BT-DCS-Rat 5', 'BT-DCS-Rat 6'};
figure;
H_1=[me_tot]';
SD_1=[sem_tot]';
hold on
for i=1:length(me_tot)
bar(i,me_tot(i),'FaceColor',colors(i,:),'EdgeColor',ed,'LineWidth',1.5)
line([i i], [H_1(i) H_1(i)+sign(H_1(i))*SD_1(i)],'Color','k', 'LineWidth',1.5);
    line([i-0.2 i+0.2], [H_1(i)+sign(H_1(i))*SD_1(i)...
        H_1(i)+sign(H_1(i))*SD_1(i)],'Color','k','LineWidth',1.5 );
ylabel('Stimulation Frequency (Hz)')
set(gca,'XTick',xtick,'XTickLabel',label_name);
set(gca, 'xticklabelrotation', 45)
title('Stimulation Frequency')
end 

H_1 =[];
SD_1 =[];


figure;
H_1=[m_cv_tot]';
SD_1=[sem_cv_tot]';
hold on
for i=1:length(me_tot)
bar(i,m_cv_tot(i),'FaceColor',colors(i,:),'EdgeColor',ed,'LineWidth',1.5)
line([i i], [H_1(i) H_1(i)+sign(H_1(i))*SD_1(i)],'Color','k', 'LineWidth',1.5);
    line([i-0.2 i+0.2], [H_1(i)+sign(H_1(i))*SD_1(i)...
        H_1(i)+sign(H_1(i))*SD_1(i)],'Color','k','LineWidth',1.5 );
ylabel('Interstimulus Interval Coefficient of Variation')
set(gca,'XTick',xtick,'XTickLabel',label_name);
set(gca, 'xticklabelrotation', 45)
title('ISI Coefficient of Variation')
end 