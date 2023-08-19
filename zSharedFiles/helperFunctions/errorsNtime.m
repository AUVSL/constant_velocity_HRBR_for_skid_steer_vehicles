function [rmse, me, time] = courseErrors(x, speed, constantVelo)
    [n,~] = size(x);
    rmse = sqrt(sum(x(:,5).^2)/n);
    me = max(abs(x(:,5)));
    if constantVelo == 1
        time = max(pathTime([x(:,1), x(:,2)], speed));
    else
        time = max(pathTime([x(:,1), x(:,2)], x(:,6)));
    end
end