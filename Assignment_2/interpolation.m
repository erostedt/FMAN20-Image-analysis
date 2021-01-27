f = [1, 2, 2, 6, 8, 9, 8];

num_points = 1000;
lx = linspace(0, 8, num_points);

Fg = zeros(num_points);

for xi = 1:num_points
    for i = 1:length(f)
        
        Fg(xi) = Fg(xi) + g(lx(xi) - i) * f(i);
        
    end
end

plot(lx, Fg)
