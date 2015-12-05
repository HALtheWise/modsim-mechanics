function p = parameters()
%PARAMETERS Summary of this function goes here
%   Detailed explanation goes here
    
    % Trebuchet parameters
    p.m1 = 100;
    p.m2 = 1;
    p.m3 = 1;
    p.l1 = .5;
    p.l2 = 1;
    p.l3 = 1.8;
    
    p.pinAngle = -10 *pi/180;
    
    % Universe parameters
    p.g  = 9.8;
    

    % Projectile parameters
    p.distanceToPool = 500; %meters
    p.poolradius = 2;       %meters
    p.pivotHeight = 2;     %meters elevation of main trebuchet pivot
    p.dragConstant = 1/2*1.2*.3*0.6; % Product of 1/2*air_mass_density*Area*Drag Coefficient
    
end

