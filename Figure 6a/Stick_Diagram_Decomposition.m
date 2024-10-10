%% Stick_Diagram_Decomposition.m
%% Plots stick diagram decomposition for Figure 6a
%
%% load data
data_path = fullfile(extractBefore(mfilename('fullpath'), mfilename));
load(fullfile(data_path, 'stickDecompData.mat')) %first four seconds of SLW for DBS/DCS treatment conditions

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
for i = 1:length(axs)
    axs(i) = nexttile;
    hold(axs(i), "on")
    axs(i).YTickLabel = [];
    axs(i).XTickLabel = [];
    axs(i).TickLength = [0, 0];
    axs(i).LineWidth = 1;
    xlim(axs(i), [xmin-0.05, xmax+0.01])
    ylim(axs(i), [ymin - 0.1, ymax + 0.4])
    %hs(i) = animatedline("LineWidth", LineWidth, "Color", colors{i}, "LineStyle", "-", "Marker", "none");
       
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
axDiffSigs = flip(findobj(axDiff,'Tag','Signal'));
legend(axDiffSigs,string({stickDecompData.name}), 'Interpreter','none')
%% plot helpers
function drawArrow(x, y, txt, props)
    % draws arrow marker on current axis
    h = annotation(gcf, 'textarrow', 'String', txt);
    set(h,'parent', gca, ...
    'position', [x(1),y(1),x(2)-x(1),y(2)-y(1)], ...
    'LineWidth', 1, 'HeadLength', 5, 'HeadWidth', 8, 'HeadStyle', 'cback1', ...
    props{:} );
end

function drawScaleBar(axh, mLen, Location)
    % adapted from https://www.mathworks.com/matlabcentral/answers/151248-add-a-scale-bar-to-my-plot
    % draws scale bar on axis specified by "axh"
    plotTypes = get(axh.Children, "Type");

    switch Location
        case 'TopRight'
            xB = axh.XLim(2);
            yB = axh.YLim(1);
            plot(axh, [xB-mLen, xB], [yB, yB], '-k', [xB, xB], [yB, yB+mLen], '-k', 'LineWidth', 2)
            %text(axh, xB-mLen/2, yB-0.07, [num2str(mLen) 'm'], 'FontSize',12,'HorizontalAlignment','center')
            xticks(axh, xB-mLen/2)
            xticklabels(axh, [num2str(mLen) 'm'])
            axh.YAxisLocation = 'right';
        
            yticks(axh, yB+mLen/2)
            yticklabels(axh, [num2str(mLen) 'm'])
            ytickangle(axh, -90)

        case 'BottomLeft'
            xB = axh.XLim(1);
            yB = axh.YLim(1);
            % if any(contains(plotTypes, 'animatedline'))
            %     h = animatedline('LineWidth', 2, 'Color', 'k', 'LineStyle','-');
            %     addpoints(h, [xB+mLen, xB], [yB, yB])
            %     addpoints(h, [xB, xB], [yB, yB+mLen])
            % else
                plot(axh, [xB+mLen, xB], [yB, yB], '-k', [xB, xB], [yB, yB+mLen], '-k', 'LineWidth', 2)
            % end
            xticks(axh, xB+mLen/2)
            xticklabels(axh, [num2str(mLen) 'm'])
            yticks(axh, yB+mLen/2)
            yticklabels(axh, [num2str(mLen) 'm'])
            ytickangle(axh, 90)
            axh.FontSize = 10;
    end
end