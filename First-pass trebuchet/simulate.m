%     theta1 = stocks(1);
%     theta2 = stocks(2);
%     theta1dot = stocks(3);
%     theta2dot = stocks(4);

stocks = [0, 0, 0, 0];

ode45(@flows, [0, 10], stocks)