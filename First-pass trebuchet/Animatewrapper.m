params = parameters();

params.pinAngle = -10*pi/180;

[Times, Stocks] = simulate(params);

animate(Times, Stocks, params)