function [] = coursePlots(pp, CVF, hbz, path, speed)
    close all
%     p1 = plot(pp(:,1), pp(:,2),'LineStyle', ':', 'Color', [1 0 0], 'LineWidth', 2); hold on;
%     p2 = plot(CVF(:,1), CVF(:,2),'LineStyle', '-.', 'Color', [0.4 0 0.4], 'LineWidth', 2); hold on;
%     p3 = plot(hbz(:,1), hbz(:,2),'LineStyle', '-', 'Color', [0 0.7 0.7 ], 'LineWidth', 2); hold on;
%     
%     assignin('base', 'path', path);
%     plot(path(:,1),path(:,2),'k--o')
% 
%     lgd = legend([p1 p2 p3],{'Pure Pursuit', 'Expert Fuzzy', 'HBZ'});
%     lgd.FontSize = 12;
%     xlabel('X (m)', 'FontSize', 12); ylabel('Y (m)', 'FontSize', 12);
%     figure;

    %angular control input over time plot
    ppTime = pathTime([pp(:,1), pp(:,2)],speed);
    CVFTime = pathTime([CVF(:,1), CVF(:,2)],speed);
    hbzTime = pathTime([hbz(:,1), hbz(:,2)], hbz(:,6));
   
    p4 = plot(ppTime, pp(:,3)+1.7,'LineStyle', ':', 'Color', [1 0 0], 'LineWidth', 2); hold on;
    p5 = plot(CVFTime, CVF(:,3)+1.7,'LineStyle', '-.', 'Color', [0.4 0 0.4], 'LineWidth', 2); hold on;
    p6 = plot(hbzTime, hbz(:,3),'LineStyle', '-', 'Color', [0 .7 .7], 'LineWidth', 2); hold on;

    lgd = legend([p4 p5 p6],{'Pure Pursuit', 'Expert Fuzzy', 'HBZ'});
    lgd.FontSize = 12;
    xlabel('Time (s)', 'FontSize', 12); ylabel('Angular Control Effort (rad/s)', 'FontSize', 12);
%     figure;
    
%     %linear control input over time plot 
%     p7 = plot(ppTime, pp(:,6),'LineStyle', '-', 'Color', [.7 .7 .7], 'LineWidth', 2); hold on;
%     p8 = plot(CVFTime, CVF(:,6),'LineStyle', '-.', 'Color', [.4 .4 .4], 'LineWidth', 2); hold on;
%     p9 = plot(hbzTime, hbz(:,6),'LineStyle', '-', 'Color', [.3 .3 .3], 'LineWidth', 2); hold on;
     
%     lgd = legend([p7 p8 p9],{'Pure Pursuit', 'Fuzzy', 'HBZ'});
%     lgd.FontSize = 12;
%     xlabel('Time (s)', 'FontSize', 12); ylabel('Linear Control Effort (m/s)', 'FontSize', 12);
%     hold off;
end
