function drawScaleBar(axh, mLen, Location)
    % adapted from https://www.mathworks.com/matlabcentral/answers/151248-add-a-scale-bar-to-my-plot
    % draws scale bar on axis specified by "axh"

    switch Location
        case 'TopRight'
            xB = axh.XLim(2);
            yB = axh.YLim(1);
            plot(axh, [xB-mLen, xB], [yB, yB], '-k', [xB, xB], [yB, yB+mLen], '-k', 'LineWidth', 2)
            xticks(axh, xB-mLen/2)
            xticklabels(axh, [num2str(mLen) 'm'])
            axh.YAxisLocation = 'right';
        
            yticks(axh, yB+mLen/2)
            yticklabels(axh, [num2str(mLen) 'm'])
            ytickangle(axh, -90)

        case 'BottomLeft'
            xB = axh.XLim(1);
            yB = axh.YLim(1);
            plot(axh, [xB+mLen, xB], [yB, yB], '-k', [xB, xB], [yB, yB+mLen], '-k', 'LineWidth', 2)
            xticks(axh, xB+mLen/2)
            xticklabels(axh, [num2str(mLen) 'm'])
            yticks(axh, yB+mLen/2)
            yticklabels(axh, [num2str(mLen) 'm'])
            ytickangle(axh, 90)
            axh.FontSize = 10;
    end
end