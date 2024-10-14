%% PSD_Plots_6e.m
% Plots power spectral density for Figure 6e

%% load data
data_path = fullfile(extractBefore(mfilename('fullpath'), mfilename));
load(fullfile(data_path, 'psdData_6e.mat'))

%% params and plot settings
cond_num = length(psdDataLeftSTN); %number of treatment conditions
beta_band = [13 35]; %beta band (Hz)
colors_left = ["#00AB55","#400387","#0081FE", "#005062"];
colors_right = ["#00AB55","#400387","#D17711", "#F2681F"];

% initialize figure and tiledlayout
lgnd_lbl_left = append({psdDataLeftSTN.name},'_', {psdDataLeftSTN.session});
lgnd_lbl_right = append({psdDataRightSTN.name},'_', {psdDataRightSTN.session});
f = figure;
f.Position(2) = 100;
f.Position(3:4) = [800, 800*4.5/5.25];
tl = tiledlayout(2, 1, "TileSpacing", "none");
axL = nexttile;
hold(axL,"on")
axR = nexttile;
hold(axR,"on")
ylim_vals_left = [-20-5 20];
ylim_vals_right = [-20 10+5];

%% plot bands and psd
% patches indicating frequency bands for left STN
patch(axL,[2 13 13 2], [ylim_vals_left(1)*ones(1,2) ylim_vals_left(2)*ones(1,2)],...
    [0.91,0.91,0.91], 'FaceAlpha', 1, 'EdgeColor', 'none')
patch(axL,[35 65 65 35], [ylim_vals_left(1)*ones(1,2) ylim_vals_left(2)*ones(1,2)],...
    [0.91,0.91,0.91], 'FaceAlpha', 1, 'EdgeColor', 'none')
patch(axL,[beta_band flip(beta_band)], [ylim_vals_left(1)*ones(1,2) ylim_vals_left(2)*ones(1,2)],...
    [0.82,0.89,1.00], 'FaceAlpha', 1, 'EdgeColor', 'none')

% patches for right STN
patch(axR,[2 13 13 2], [ylim_vals_right(1)*ones(1,2) ylim_vals_right(2)*ones(1,2)],...
    [0.91,0.91,0.91], 'FaceAlpha', 1, 'EdgeColor', 'none')
patch(axR,[35 65 65 35], [ylim_vals_right(1)*ones(1,2) ylim_vals_right(2)*ones(1,2)],...
    [0.91,0.91,0.91], 'FaceAlpha', 1, 'EdgeColor', 'none')
patch(axR, [beta_band flip(beta_band)], [ylim_vals_right(1)*ones(1,2) ylim_vals_right(2)*ones(1,2)],...
    [0.82,0.89,1.00], 'FaceAlpha', 1, 'EdgeColor', 'none')

% plot psds
for i = 1:cond_num
    psdDB_L = psdDataLeftSTN(i).psdDB;
    psdDB_R = psdDataRightSTN(i).psdDB;
    freqDB = psdDataLeftSTN(i).freqDB;
    plot(axL, freqDB, psdDB_L, 'LineWidth', 3.5, 'Color', colors_left{i})
    plot(axR, freqDB, psdDB_R, 'LineWidth', 3.5, 'Color', colors_right{i})

end

% line markers for frequency bands on Left STN
text(axL, 47.5, 17, 'Broad Band', 'HorizontalAlignment','center', 'FontSize', 15, 'FontWeight','bold')
line(axL,[2 39], [17 17], 'Color', [0.15 0.15 0.15], 'LineWidth', 2)
line(axL,[56 65], [17 17], 'Color', [0.15 0.15 0.15], 'LineWidth', 2)
line(axL,[2 2], [16 18], 'Color', [0.15 0.15 0.15], 'LineWidth', 1.5)
line(axL,[65 65], [16 18], 'Color', [0.15 0.15 0.15], 'LineWidth', 1.5)

text(axL, 24, -17, 'Beta Band', 'HorizontalAlignment','center', 'FontSize',15, 'FontWeight','bold')
line(axL,[13 16.5], [-17 -17], 'Color', [0.15 0.15 0.15], 'LineWidth', 2.5)
line(axL,[31.5 35], [-17 -17], 'Color', [0.15 0.15 0.15], 'LineWidth', 2.5)
line(axL,[13 13], [-18 -16], 'Color', [0.15 0.15 0.15], 'LineWidth', 2)
line(axL,[35 35], [-18 -16], 'Color', [0.15 0.15 0.15], 'LineWidth', 2)

% set axis settings and add legend
xticks(axL, [2, 13, 35, 65])
xticks(axR, [2, 13, 35, 65])
yticks(axL, [-20, 0, 20])
yticks(axR, [-20, 0, 10])
xlim(axL,[1.1 66])
xlim(axR,[1.1 66])
ylim(axL, ylim_vals_left)
ylim(axR, ylim_vals_right)
xlabel(axL, 'Frequency (Hz)')
xlabel(axR, 'Frequency (Hz)')
ylabel(axL, {'Left STN';'PSD (dB/Hz)'})
ylabel(axR, {'Right STN';'PSD (dB/Hz)'})

axL.LineWidth = 2;
axR.LineWidth = 2;
axL.XAxis.TickLength = [0, 0];
axR.XAxis.TickLength = [0, 0];

axL.FontSize = 15;
axL.FontName = 'Arial';
axL.FontWeight = 'bold';
axR.FontSize = 15;
axR.FontName = 'Arial';
axR.FontWeight = 'bold';

axL_lines = findobj(axL, 'Type', 'line', 'LineWidth', 3.5);
lgnL = legend(flip(axL_lines), lgnd_lbl_left, 'Interpreter', 'none');
lgnL.Position(1) = lgnL.Position(1)-0.06;
lgnL.Position(2) = lgnL.Position(2)-0.06;
legend(axL,'boxoff')
axR_lines = findobj(axR, 'Type', 'line');
lgnR = legend(flip(axR_lines), lgnd_lbl_right, 'Interpreter', 'none');
lgnR.Position(1) = lgnR.Position(1)-0.06;
lgnR.Position(2) = lgnR.Position(2)-0.06;
legend boxoff
set(axL,'Layer','top')
set(axR,'Layer','top')