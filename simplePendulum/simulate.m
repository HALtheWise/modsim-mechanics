[Times, Stocks] = ode45(@flows, [0 20], [0 2]);
plot(Times, Stocks);