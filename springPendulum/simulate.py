[Times, Stocks] = ode45(@flows, [0 100], [[-1;-1];[0;0]]);
plot(Stocks(:,1), Stocks(:,2), '-')
