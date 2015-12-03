
y0 = zeros(4,1);
y0(1) = 4*pi / 3; % Starting position of main beam is 60deg below left horizontal

params = parameters();

options = odeset('Events', @(t,y) event(t,y,params));

[Times, Stocks] = ode45(@(t, y) flows(t, y, params), [0, 5], y0, options);
clf
plot(Times, Stocks);
legend('theta1', 'theta2', 'theta1dot', 'theta2dot')
    
%pause
%animate(Times, Stocks)