params = parameters();

params.pinAngle = -5*pi/180;

[Times, Stocks] = simulate(params);

animate(Times, Stocks, params)