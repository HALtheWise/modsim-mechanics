function [Times, Stocks] = simulate(params)
    
    y0 = zeros(4,1);
    y0(1) = 4*pi / 3; % Starting position of main beam is 60deg below left horizontal
    
    options = odeset('Events', @(t,y) event(t,y,params), 'RelTol', 1e-4);

    [Times, Stocks] = ode45(@(t, y) flows(t, y, params), [0, 20], y0, options);
    
end