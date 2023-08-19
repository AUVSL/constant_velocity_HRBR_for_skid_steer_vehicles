function [] = coursePlots(pp, fzy, path, speed)
    close all;
    %position plot
    p1 = plot(pp(:,1), pp(:,2),'LineStyle', '-', 'Color', [.6 .6 .6], 'LineWidth', 2); hold on;
    p2 = plot(fzy(:,1), fzy(:,2),'LineStyle', '-', 'Color', [.2 .2 .2], 'LineWidth', 2);

    assignin('base', 'path', path);
    plot(path(:,1),path(:,2),'k--o')

    legend([p1 p2],{'Pure Pursuit','Expert Fuzzy System'})
    xlabel('X (m)'); ylabel('Y (m)');
    hold off; figure;

    %control input over time plot
    ppTime = pathTime([pp(:,1),pp(:,2)],speed); 
    fzyTime = pathTime([fzy(:,1),fzy(:,2)],speed);
    p3 = plot(ppTime, pp(:,3),'LineStyle', '-', 'Color', [.6 .6 .6], 'LineWidth', 2); hold on;
    p4 = plot(fzyTime, fzy(:,3),'LineStyle', '-', 'Color', [.2 .2 .2], 'LineWidth', 2);
    
    legend([p3 p4],{'Pure Pursuit','Expert Fuzzy System'})
    xlabel('Time (s)'); ylabel('Control Effort (rad/s)');
    hold off;
end