function time = pathTime(path,speed)
    [n,~]=size(path);
    [m,~]=size(speed);
    time=zeros(n,1);
    if m == 1
        for i=1:n-1
            dist = sqrt((path(i+1,1)-path(i,1))^2 + (path(i+1,2)-path(i,2))^2);
            time(i+1) = time(i) + dist/speed;
        end    
    else
        for i=1:n-1
            dist = sqrt((path(i+1,1)-path(i,1))^2 + (path(i+1,2)-path(i,2))^2);
            time(i+1) = time(i) + dist/speed(i);
        end         
    end
        
    
    