function [res] = flows(~,stocks)
    %returns the rate of change of our position and velocity
    
    %constants
    m1 = 100;
    m2 = 1;
    m3 = 1;
    l1 = .5;
    l2 = 1;
    l3 = 1.5;
    g = 9.8;
    
    %things that change   
    theta1 = stocks(1);
    theta2 = stocks(2);
    theta1dot = stocks(3);
    theta2dot = stocks(4);
    
    %rate of change
    cells = num2cell([(1/2).*(l1.^2.*m1+l2.^2.*(m2+m3)+(-1).*l2.^2.*m3.*cos(theta1+(-1) ...
          .*theta2).^2).^(-1).*(g.*((2.*l1.*m1+(-1).*l2.*(2.*m2+m3)).*cos(theta1) ...
          +l2.*m3.*cos(theta1+(-2).*theta2))+(-1).*l2.^2.*m3.*sin(2.*(theta1 ...
          +(-1).*theta2)).*theta1dot.^2+(-2).*l2.*l3.*m3.*sin(theta1 ...
          +(-1).*theta2).*theta2dot.^2),l3.^(-1).*(l1.^2.*m1+ ...
          l2.^2.*(m2+m3)+(-1).*l2.^2.*m3.*cos(theta1+(-1).*theta2).^2).^(-1).* ...
          ((-1).*g.*((-1).*l2.*((-1).*l1.*m1+l2.*(m2+m3)).*cos(theta1).*cos( ...
          theta1+(-1).*theta2)+(l1.^2.*m1+l2.^2.*(m2+m3)).*cos(theta2))+l2.*( ...
          l1.^2.*m1+l2.^2.*(m2+m3)).*sin(theta1+(-1).*theta2).*theta1dot ...
          .^2+(1/2).*l2.^2.*l3.*m3.*sin(2.*(theta1+(-1).*theta2)).* ...
          theta2dot.^2)]);
    
    [theta1dotdot, theta2dotdot] = deal(cells{:});
    
    res = [theta1dot; theta2dot; theta1dotdot; theta2dotdot];
end
