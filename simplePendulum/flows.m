function slopes = flows(~, Stocks)

    theta = Stocks(1);
    thetaDot = Stocks(2);
    
    g = 10;
    m1 = 2;
    m2 = 5;
    l1 = 1;
    l2 = 5;
    
    thetaDotDot = -g*cos(theta)*(m1*l1 - m2*l2) / (m1*l1^2 + m2 * l2^2);
    
    slopes = [0; 0];
    
    slopes(1) = thetaDot;
    slopes(2) = thetaDotDot;
end