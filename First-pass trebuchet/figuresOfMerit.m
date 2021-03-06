function [ fom ] = figuresOfMerit( Times, Stocks, params )
%FIGURESOFMERIT Given the output of a 
%   Detailed explanation goes here

    global totalFOMtime;
    tic;

    p = params;

    theta1 = Stocks(:,1);
    theta2 = Stocks(:,2);
    
    theta1dot = Stocks(:,3);
    theta2dot = Stocks(:,4);
    
    %P1 =        [p.l1*-cos(theta1(end)); p.l1*-sin(theta1(end))];
    P2 =        [p.l2*cos(theta1(end)); p.l2*sin(theta1(end))];
    P3 = P2 +   [p.l3*cos(theta2(end)); p.l3*sin(theta2(end))];
    
    V3 =    [(-1).*p.l2.*sin(theta1(end)).*theta1dot(end)+(-1).*p.l3.*sin(theta2(end)).*theta2dot(end); ...
            p.l2.*cos(theta1(end)).*theta1dot(end)+p.l3.*cos(theta2(end)).*theta2dot(end)];
    
    fom.releaseHeight = P3(2);      % meters
    fom.releaseVelocity = V3;       % meters/s vector
    fom.releaseSpeed = norm(V3);    % meters/s
    fom.releaseTime = Times(end);   % seconds
    
    [fom.flightDistance, fom.flightTime, fom.baseballTimes, fom.baseballStocks]...
        = baseball_simulation(P3, V3, params);
    if isempty(fom.baseballStocks)
        fom.maxHeight = 0;
    else
        fom.maxHeight = max(fom.baseballStocks(:,2));
    end
    
    fom.missAmount = abs(fom.flightDistance - params.distanceToPool);
    if fom.missAmount < - params.poolradius
        fom.result = 'short';
    elseif fom.missAmount > params.poolradius
        fom.result = 'long';
    else
        fom.result = 'good shot';
    end

    V3 =    [(-1).*p.l2.*sin(theta1).*theta1dot+(-1).*p.l3.*sin(theta2).*theta2dot, ...
            p.l2.*cos(theta1).*theta1dot+p.l3.*cos(theta2).*theta2dot];
%     length(V3)
%     length(Times)
    A3x = diff(V3(:,1)) ./ diff(Times);
    A3y = diff(V3(:,2)) ./ diff(Times);
    A3 = arrayfun(@(ax, ay) norm([ax ay+params.g]), A3x, A3y);
    fom.accelerations = A3 / 9.8;
    fom.maxAcceleration = max(fom.accelerations);
    
    totalFOMtime = totalFOMtime + toc; %Track the time in FOM calculations
end

