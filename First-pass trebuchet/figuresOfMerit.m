function [ fom ] = figuresOfMerit( Times, Stocks, params )
%FIGURESOFMERIT Given the output of a 
%   Detailed explanation goes here

    global totalFOMtime;
    tic;

    p = params;

    theta1 = Stocks(end,1);
    theta2 = Stocks(end,2);
    
    theta1dot = Stocks(end,3);
    theta2dot = Stocks(end,4);
    
    %P1 =        [p.l1*-cos(theta1); p.l1*-sin(theta1)];
    P2 =        [p.l2*cos(theta1); p.l2*sin(theta1)];
    P3 = P2 +   [p.l3*cos(theta2); p.l3*sin(theta2)];
    
    V3 =    [(-1).*p.l2.*sin(theta1).*theta1dot+(-1).*p.l3.*sin(theta2).*theta2dot; ...
            p.l2.*cos(theta1).*theta1dot+p.l3.*cos(theta2).*theta2dot];
    
    fom.releaseHeight = P3(2);      % meters
    fom.releaseVelocity = V3;       % meters/s vector
    fom.releaseSpeed = norm(V3);    % meters/s
    fom.releaseTime = Times(end);   % seconds
    
    [fom.flightDistance, fom.flightTime, fom.baseballTimes, fom.baseballStocks]...
        = baseball_simulation(P3, V3, params);
    
    totalFOMtime = totalFOMtime + toc; %Track the time in FOM calculations
end

