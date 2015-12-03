%     theta1 = stocks(1);
%     theta2 = stocks(2);
%     theta1dot = stocks(3);
%     theta2dot = stocks(4);

y0 = zeros(4,1);
y0(1) = 4*pi / 3; % Starting position of main beam is 60deg below left horizontal

params = parameters();

[Times, Stocks] = ode45(@(t, y) flows(t, y, params), [0, 5], y0);
plot(Times, Stocks);
legend('theta1', 'theta2', 'theta1dot', 'theta2dot')

%animate(Times, Stocks, params)