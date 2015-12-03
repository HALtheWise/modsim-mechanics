function [ fom ] = figuresOfMerit( Times, Stocks, params )
%FIGURESOFMERIT Given the output of a 
%   Detailed explanation goes here

    p = params;

    theta1 = Stocks(end,1);
    theta2 = Stocks(end,2);
    
    theta1dot = Stocks(end,3);
    theta2dot = Stocks(end,4);
    
    P1 =        [p.l1*-cos(theta1) p.l1*-sin(theta1)];
    P2 =        [p.l2*cos(theta1) p.l2*sin(theta1)];
    P3 = P2 +   [p.l3*cos(theta2) p.l3*sin(theta2)];
    
    V1 =        [p.l1*-cos(theta1dot) p.l1*-sin(theta1dot)];
    V2 =        [p.l2*cos(theta1dot) p.l2*sin(theta1dot)];
    V3 = V2 +   [p.l3*cos(theta2dot) p.l3*sin(theta2dot)];
    
    fom.releaseHeight = P3(2);      % meters
    fom.releaseVelocity = V3;       % meters/s vector
    fom.releaseSpeed = norm(V3);    % meters/s
    
    
end

