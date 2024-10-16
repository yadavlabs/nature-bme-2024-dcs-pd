%% EXTENDED DATA FIGURE 4 PLOT GENERATION
% **NOTE** Generates Extended Data Figure 4a and b. 
% Extended Data Figure 4 c,d,e were generated elsewhere.

%% Input folder path, load data

% Specify folder path with data
% example: data_path = '/Users/benrees/Documents/figures_and_data/ExtendedDataFigure4';
data_path = extractBefore(mfilename('fullpath'), mfilename); %change if data is in different path

% Specify file name
file_name = 'rodentData_Ext4ab.mat';
load(fullfile(data_path,file_name))

%% EXTENDED DATA FIGURE 4A

figure; s = scatter3(preScore(:,1),preScore(:,2),preScore(:,3),'filled');
s.MarkerEdgeColor = '#EF8B34';
s.MarkerFaceColor = '#EF8B34';
hold on; s = scatter3(offScore(:,1),offScore(:,2),offScore(:,3),'filled');
s.MarkerEdgeColor = '#4C4C4C';
s.MarkerFaceColor = '#4C4C4C';
s = scatter3(openScore(:,1),openScore(:,2),openScore(:,3),'filled');
s.MarkerEdgeColor = '#924EE0';
s.MarkerFaceColor = '#924EE0';
s = scatter3(closedScore(:,1),closedScore(:,2),closedScore(:,3),'filled');
s.MarkerEdgeColor = '#65D8B3';
s.MarkerFaceColor = '#65D8B3';
legend('Pre-Lesion','Off Stim','C-DCS','BT-DCS')
xlabel('PC 1')
ylabel('PC 2')
zlabel('PC 3')
set(gca,'FontSize',15)
view(29.3809,22.7895)

%% EXTENDED DATA FIGURE 4B

figure; s = scatter(preScore(:,1),preScore(:,2),'filled');
s.MarkerEdgeColor = '#EF8B34';
s.MarkerFaceColor = '#EF8B34';
hold on; s = scatter(offScore(:,1),offScore(:,2),'filled');
s.MarkerEdgeColor = '#4C4C4C';
s.MarkerFaceColor = '#4C4C4C';
s = scatter(openScore(:,1),openScore(:,2),'filled');
s.MarkerEdgeColor = '#924EE0';
s.MarkerFaceColor = '#924EE0';
s = scatter(closedScore(:,1),closedScore(:,2),'filled');
s.MarkerEdgeColor = '#65D8B3';
s.MarkerFaceColor = '#65D8B3';
legend('Pre-Lesion','Off Stim','C-DCS','BT-DCS')
xlabel('PC 1')
ylabel('PC 2')
set(gca,'FontSize',15)
