n = length(DenseMasses);

optimalAngles = zeros(n,2);
Hangtimes = zeros(n,2);
Altitudes = zeros(n,2);
Accelerations = zeros(n,2);

for i = 1:n
    disp(i)
    
    mass = DenseMasses(i);
    pin1 = fminsearch(@(angle) abs(interp1(Angles, DenseResults(i,:), angle)-params.distanceToPool), -pi/2);
    pin2 = fminsearch(@(angle) abs(interp1(Angles, DenseResults(i,:), angle)-params.distanceToPool), 0);
    optimalAngles(i,:) = [pin1 pin2];
    
    params = parameters();
    params.m3 = mass;
    params.pinAngle = pin1;
    [Times, Stocks] = simulate(params);
    fom = figuresOfMerit(Times, Stocks, params);
    Hangtimes(i,1) = fom.flightTime;
    Altitudes(i,1) = fom.maxHeight;
    Accelerations(i,1) = fom.maxAcceleration;
    
    params.m3 = mass;
    params.pinAngle = pin2;
    [Times, Stocks] = simulate(params);
    fom = figuresOfMerit(Times, Stocks, params);
    Hangtimes(i,2) = fom.flightTime;
    Altitudes(i,2) = fom.maxHeight;
    Accelerations(i,2) = fom.maxAcceleration;
    
    
end