function [rmse, me] = courseErrors(x)
    [n,~] = size(x);
    rmse = sqrt(sum(x(:,5).^2)/n);
    me = max(abs(x(:,5)));
end