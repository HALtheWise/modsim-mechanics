params = parameters();

params.pinAngle = -20*pi/180;

[Times, Stocks] = simulate(params);

animate(Times, Stocks, params)

fom=figuresOfMerit(Times, Stocks, params)