%% Stick_Diagram_Decomposition_6a.m
%% Plots stick diagram decomposition for Figure 6a
%
%% load data
data_path = extractBefore(mfilename('fullpath'), mfilename); %change if data is in different path
load(fullfile(data_path, 'stickDecompData_6a.mat')) %first four seconds of SLW for DBS/DCS treatment conditions

%% add plot helper functions
%% add plot helper functions
% uses:
%   drawArrow
%   drawScaleBar
helper_path = fullfile(extractBefore(data_path, 'Figure 6'), 'helpers');
addpath(helper_path)

%% params and plot settings
pns_fs = 96; %sample rate of MoCap
event_len = 4; %time duration for plotting displacement (sec)
time_points = 0:event_len; %time points for arrow markers (sec)
sec_locs = time_points * pns_fs + 1; %indices of time_points for pns_fs sample rate
num_conds = length(stickDecompData); %number of treatment conditions

colors = ["#00AB55","#400387","#F2681F","#005062","#DE2C62","#660E00"]; %color scheme for treatment conditions
SegDens = 2; %density of samples to display on the plot
LineWidth = 0.5; %width of plot lines
arrow_x_reference = 4; % 

% x and y limits
xy_len = size(stickDecompData(1).x,1);
xvals = cell2mat({stickDecompData.x});
yvals = cell2mat({stickDecompData.y});
xmin = min(xvals, [], "all");
xmax = max(xvals, [], "all");
ymin = min(yvals, [], "all");
ymax = max(yvals, [], "all");

% initialize figure and tilelayout
lgnd_lbl = append({stickDecompData.name},'_', {stickDecompData.session});
f = figure;
f.Color = [1,1,1];
fpos = f.Position;
fpos(2) = 1;
fpos(3) = 500;
fpos(4) = 800;
f.Position = fpos;

tl = tiledlayout(num_conds,1, "TileSpacing", "none");
axs = gobjects(num_conds,1);
hs = gobjects(num_conds,1);

%% initialize plots
% initialize animated plots
for i = 1:num_conds
    axs(i) = nexttile;
    hold(axs(i), "on")
    axs(i).YTickLabel = [];
    axs(i).XTickLabel = [];
    axs(i).TickLength = [0, 0];
    axs(i).LineWidth = 1;
    xlim(axs(i), [xmin-0.05, xmax+0.01])
    ylim(axs(i), [ymin - 0.1, ymax + 0.4])
end
xlim(axs, [xmin-0.05, xmax+0.01])
ylim(axs, [ymin - 0.1, ymax + 0.4])
drawScaleBar(axs(end,1), 0.5, 'BottomLeft')

%% plotting
k = 1; %index for arrow markers
for m = 1:SegDens:xy_len %loop through sticks
    tp = sec_locs(k); %time points for arrows
    for i = 1:length(axs) %loop through treatment conditions
        if m >= tp %plots an arrow every second
            set(f, 'CurrentAxes', axs(i))
            tp_txt = [num2str(time_points(k)) 's'];
            arrow_x_vals = stickDecompData(i).x(tp, arrow_x_reference)*ones(1,2);
            arrow_y_vals = [stickDecompData(i).y(tp,end)+0.2, stickDecompData(i).y(tp, end)+0.02];
            drawArrow(arrow_x_vals, arrow_y_vals, tp_txt, {'Color', '#606060'})
            
        end
        plot(axs(i), stickDecompData(i).x(m,:), stickDecompData(i).y(m,:),...
            'Color', colors{i}, 'LineWidth', LineWidth) %plot stick
    end
    if m >= tp
        k = k + 1;
    end
    
end

ax_stick_lgnd = gobjects(num_conds, 1); %get a single stick for each condition for legend
for i = 1:num_conds
    line_tmp = findobj(axs(i), "Type", "Line");
    ax_stick_lgnd(i) = line_tmp(1);
end
 
lgnd = legend(ax_stick_lgnd,lgnd_lbl, 'Interpreter','none', 'Location','northeast'); %legend
lgnd.Position = [0.679266661631266,0.826541664377848,0.3132000050354,0.104125002288818];
lgnd.Box = "off";