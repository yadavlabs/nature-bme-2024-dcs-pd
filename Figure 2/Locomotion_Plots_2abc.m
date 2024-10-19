%% plots Figure 2 a,b,c - locomotion/movement tracking of the rat

%% load data
data_path = extractBefore(mfilename('fullpath'), mfilename); %change if data is in different path

% Specify file name
file_name = 'rodentData_2abc.mat';
load(fullfile(data_path,file_name))

SampFreq = 30; % frame/sec
sm_traj =60; % smooth the trajectory of n seconds

names = {data.name};

%% Pre-lesion session
loc_a = contains(names, 'Spider_prelesion_loco.mat');
data_a =  data(loc_a);
%load('Spider_prelesion_loco.mat')
Xs = smooth(data_a.X,sm_traj); % smoothing of 2 seconds
Ys = smooth(data_a.Y,sm_traj); % smoothing of 2 seconds
sp = SampFreq*(sqrt(diff(Xs).^2 + diff(Ys).^2));
index1 =find(data_a.t>=300);
index2 = find(data_a.t>=2100);
z = zeros(size(data_a.X));
figure;
scatter(Xs(index1:index2),Ys(index1:index2),1, sp(index1:index2), 'filled')
xlabel('X-axes')
ylabel('Y-axes')
title('Pre-lesion')
xlim([0 80]); ylim([0 80]); axis square;
hold on
c = colorbar;
c.Label.String = 'Speed cm/s';
colormap(jet)
caxis([0 20])

%% Off-stim session
loc_b = contains(names, 'Spider_offstim_loco.mat');
data_b =  data(loc_b);
%load('Spider_offstim_loco.mat')
Xs = smooth(data_b.X,sm_traj); % smoothing of 2 seconds
Ys = smooth(data_b.Y,sm_traj); % smoothing of 2 seconds
sp = SampFreq*(sqrt(diff(Xs).^2 + diff(Ys).^2));
index1 =find(data_b.t>=300);
index2 = find(data_b.t>=2100);
z = zeros(size(data_b.X));
figure;
scatter(Xs(index1:index2),Ys(index1:index2),1, sp(index1:index2), 'filled')
xlabel('X-axes')
ylabel('Y-axes')
title('Off-stimulation')
xlim([0 80]); ylim([0 80]); axis square;
hold on
c = colorbar;
c.Label.String = 'Speed cm/s';
colormap(jet)
caxis([0 20])
%% BT-DCS session
loc_c = contains(names, 'Spider_BTDCS_loco.mat');
data_c =  data(loc_c);
%load('Spider_BTDCS_loco.mat')
Xs = smooth(data_c.X,sm_traj); % smoothing of 2 seconds
Ys = smooth(data_c.Y,sm_traj); % smoothing of 2 seconds
sp = SampFreq*(sqrt(diff(Xs).^2 + diff(Ys).^2));
index1 =find(data_c.t>=300);
index2 = find(data_c.t>=2100);
z = zeros(size(data_c.X));
figure;
scatter(Xs(index1:index2),Ys(index1:index2),1, sp(index1:index2), 'filled')
xlabel('X-axes')
ylabel('Y-axes')
title('Beta-triggered DCS')
xlim([0 80]); ylim([0 80]); axis square;
hold on
c = colorbar;
c.Label.String = 'Speed cm/s';
colormap(jet)
caxis([0 20])