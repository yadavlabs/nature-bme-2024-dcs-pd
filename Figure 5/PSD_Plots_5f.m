%% PSD_Plots_5f.m
% Plots power spectral density for Figure 5f

%% load data
data_path = fullfile(extractBefore(mfilename('fullpath'), mfilename));
load(fullfile(data_path, 'psdData_5f.mat'))


%% params and plot settings
cond_num = length(psdData); %number of treatment conditions
beta_band = [13 35]; %beta band (Hz)


colors = ["#003C96","#11A69C","#924AF7","#D17711","#0081FE","#FF5383"];
colors_rgb = hex2rgb(colors, "OutputType", "double"); % colors_rgb(i,:) to get each color 

% initialize figure and tiledlayout for psd in decibels
lgnd_lbl = append({psdData.name},'_', {psdData.session});
f1 = figure;
f1.Position(2) = 100;
f1.Position(3:4) = [800, 800*4.5/5.25];

tl1 = tiledlayout(2,1, "TileSpacing","none");
ax1L = nexttile;
hold(ax1L,"on")
ax1R = nexttile;
hold(ax1R,"on")
ylim_vals_left = [-20-5 20];
ylim_vals_right = [-20 10+5];


%% plot bands and psd in decibels
% patches indicating frequency bands for left STN
patch(ax1L,[2 13 13 2], [ylim_vals_left(1)*ones(1,2) ylim_vals_left(2)*ones(1,2)],...
    [0.91,0.91,0.91], 'FaceAlpha', 1, 'EdgeColor', 'none')
patch(ax1L,[35 65 65 35], [ylim_vals_left(1)*ones(1,2) ylim_vals_left(2)*ones(1,2)],...
    [0.91,0.91,0.91], 'FaceAlpha', 1, 'EdgeColor', 'none')
patch(ax1L,[beta_band flip(beta_band)], [ylim_vals_left(1)*ones(1,2) ylim_vals_left(2)*ones(1,2)],...
    [0.82,0.89,1.00], 'FaceAlpha', 1, 'EdgeColor', 'none')

% patches for right STN
patch(ax1R,[2 13 13 2], [ylim_vals_right(1)*ones(1,2) ylim_vals_right(2)*ones(1,2)],...
    [0.91,0.91,0.91], 'FaceAlpha', 1, 'EdgeColor', 'none')
patch(ax1R,[35 65 65 35], [ylim_vals_left(1)*ones(1,2) ylim_vals_left(2)*ones(1,2)],...
    [0.91,0.91,0.91], 'FaceAlpha', 1, 'EdgeColor', 'none')
patch(ax1R, [beta_band flip(beta_band)], [ylim_vals_right(1)*ones(1,2) ylim_vals_right(2)*ones(1,2)],...
    [0.82,0.89,1.00], 'FaceAlpha', 1, 'EdgeColor', 'none')

% plot psds 
for i = 1:cond_num
    psdDB_L = psdData(i).psdDB_L;
    psdDB_R = psdData(i).psdDB_R;
    freqDB = psdData(i).freqDB;
    plot(ax1L, freqDB, psdDB_L, 'LineWidth',3, 'Color', colors{i})
    plot(ax1R, freqDB, psdDB_R, 'LineWidth',3, 'Color', colors{i})
    
end

% line markers for frequency bands on Left STN
text(ax1L, 47.5, 17, 'Broad Band', 'HorizontalAlignment','center', 'FontSize', 15, 'FontWeight','bold')
line(ax1L,[2 39], [17 17], 'Color', [0.15 0.15 0.15], 'LineWidth', 2)
line(ax1L,[56 65], [17 17], 'Color', [0.15 0.15 0.15], 'LineWidth', 2)
line(ax1L,[2 2], [16 18], 'Color', [0.15 0.15 0.15], 'LineWidth', 1.5)
line(ax1L,[65 65], [16 18], 'Color', [0.15 0.15 0.15], 'LineWidth', 1.5)

text(ax1L, 24, -17, 'Beta Band', 'HorizontalAlignment','center', 'FontSize',15, 'FontWeight','bold')
line(ax1L,[13 16.5], [-17 -17], 'Color', [0.15 0.15 0.15], 'LineWidth', 2.5)
line(ax1L,[31.5 35], [-17 -17], 'Color', [0.15 0.15 0.15], 'LineWidth', 2.5)
line(ax1L,[13 13], [-18 -16], 'Color', [0.15 0.15 0.15], 'LineWidth', 2)
line(ax1L,[35 35], [-18 -16], 'Color', [0.15 0.15 0.15], 'LineWidth', 2)

% set axis settings and add legend
xticks(ax1L, [2, 13, 35, 65])
xticks(ax1R, [2, 13, 35, 65])
yticks(ax1L, [-20, 0, 20])
yticks(ax1R, [-20, 0, 10])
xlim(ax1L,[1.1 66])
xlim(ax1R,[1.1 66])
ylim(ax1L, ylim_vals_left)
ylim(ax1R, ylim_vals_right)
xlabel(ax1L, 'Frequency (Hz)')
xlabel(ax1R, 'Frequency (Hz)')
ylabel(ax1L, {'Left STN';'PSD (dB/Hz)'})
ylabel(ax1R, {'Right STN';'PSD (dB/Hz)'})
ax1L.LineWidth = 2;
ax1R.LineWidth = 2;
ax1L.XAxis.TickLength = [0, 0];
ax1R.XAxis.TickLength = [0, 0];
ax1L.FontSize = 15;
ax1L.FontName = 'Arial';
ax1L.FontWeight = 'bold';
ax1R.FontSize = 15;
ax1R.FontName = 'Arial';
ax1R.FontWeight = 'bold';
ax1R_lines = findobj(ax1R, 'Type', 'line');
lgn = legend(flip(ax1R_lines), lgnd_lbl, 'Interpreter','none');
lgn.Position(1) = lgn.Position(1)-0.06;
legend boxoff
set(ax1L,'Layer','top')
set(ax1R,'Layer','top')

%% isometric psd 
% initialize figure and tiledlayout for isometric psd
f2  = figure;
f2.Position(3:4) = [800, 660];
f2.Position(2) = 100;
t2 = tiledlayout(2,1, "TileSpacing","compact");
ax2L = nexttile;
hold(ax2L,"on")
ax2R = nexttile;
hold(ax2R,"on")


% plot isometric psd
for i = 1:cond_num
    
    psd_L = psdData(i).psd_L;
    psd_R = psdData(i).psd_R;
    freq = psdData(i).freq;
    fill3(ax2L, i*ones(1,length(freq)), freq, psd_L, colors_rgb(i,:), 'FaceAlpha', 1)

    fill3(ax2R, [i i*ones(1,length(freq)-2) i], freq, psd_R, colors_rgb(i,:), 'FaceAlpha', 1)

end

box(ax2L, "on")
grid(ax2L, "on")
box(ax2R, "on")
grid(ax2R, "on")
ylim(ax2L,[6, 40])
ylim(ax2R,[6, 40])
yticks(ax2L, [8, 13, 20, 35])
yticks(ax2R, [8, 13, 20, 35])
xticks(ax2L, [])
xticks(ax2R, [])

zlim(ax2L, [0, 5])
zticks(ax2L, [0, 5])
zlim(ax2R, [0, 8])
zticks(ax2R, [0, 8])

zlabel(ax2L,'\muV^{2}/Hz')
zlabel(ax2R,'\muV^{2}/Hz')
ylabel(ax2L, 'Frequency (Hz)')
ylabel(ax2R, 'Frequency (Hz)')
view(ax2L, 75, 52)
view(ax2R, 75, 52)

title(ax2L, 'Left STN')
title(ax2R, 'Right STN')