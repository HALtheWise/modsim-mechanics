function p = parameters()
%PARAMETERS Summary of this function goes here
%   Detailed explanation goes here
    
    % Trebuchet parameters
    p.m1 = 10000; %10 ton weight 
    p.m2 = 100;
    p.m3 = 80.7; %Average person
    p.l1 = 1;
    p.l2 = 10;
    p.l3 = 14.76;
    
    p.pinAngle = -30 *pi/180;
    
    % Universe parameters
    p.g  = 9.8;
    

    % Projectile parameters
    p.distanceToPool = 500; %meters
    p.poolradius = 2;       %meters
    p.pivotHeight = 2;     %meters elevation of main trebuchet pivot
    p.dragConstant = 1/2*1.2*.3*0.6; % Product of 1/2*air_mass_density*Area*Drag Coefficient
    
end

