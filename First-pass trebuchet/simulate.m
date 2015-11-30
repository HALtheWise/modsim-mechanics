%     theta1 = stocks(1);
%     theta2 = stocks(2);
%     theta1dot = stocks(3);
%     theta2dot = stocks(4);

stocks = [(4*pi/3), 0, 0, 0];

[Times, Stocks] = ode45(@flows, [0, 1], stocks);
plot(Times, Stocks);
legend('theta1', 'theta2', 'theta1dot', 'theta2dot')

animate(Times,Stocks)