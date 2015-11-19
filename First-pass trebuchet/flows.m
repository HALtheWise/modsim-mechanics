function [res] = flows(~,stocks)
    %returns the rate of change of our position and velocity
    
    %constants
    m1 = 100;
    m2 = 1;
    m3 = 1;
    l1 = .5;
    l2 = 1;
    l3 = .5;
    g = 9.8;
    
    %things that change   
    theta1 = stocks(1);
    theta2 = stocks(2);
    theta1dot = stocks(3);
    theta2dot = stocks(4);
    
    %rate of change
    theta1dotdot = ((g * l1 * cos(theta1) * m1) - (l2 * (g * cos(theta1) * m2 + sin(theta1 - theta2) * m3 ...
        * (-g * sin(theta2) + l2 * cos(theta1 - theta2) * theta1dot^2 + l3 * theta2dot^2))) / ...
        (l1^2 * m1 + l2^2 * (m2 + sin(theta1 - theta2)^2 * m3)));
    
    theta2dotdot = ((-l1 * m1 * (g * l2 * cos(theta1) * cos(theta1 - theta2) + ...
        g * l1 * cos(theta2) - l1 * l2 * sin(theta1 - theta2) * theta1dot^2) + ...
        l2^2 * sin(theta1 - theta2) * (m2 * (-g * sin(theta1) + l2 * theta1dot^2) + ...
        m3 * (-g * sin(theta1) + l2 * theta1dot^2 + l3 * cos(theta1 - theta2) * theta2dot^2)))/ ...
        (l3 * (l1^2 * m1 + l2^2 * (m2 + sin(theta1 - theta2)^2 * m3))));
    
    res = [theta1dot; theta2dot; theta1dotdot; theta2dotdot];
end
