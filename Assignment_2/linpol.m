function lpx = linpol(x)

lpx = 0;

if x >= -1 && x <= 0
    lpx = x + 1;
    
elseif x > 0 && x <= 1
    lpx = 1-x;



end

