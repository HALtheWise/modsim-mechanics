%% Calculating
Masses = linspace(0,100,20);
Angles = linspace(-100,0,1000)*pi/180;
Results = zeros(length(Masses), length(Angles));

for mass = 1:length(Masses)
    params = parameters();
    params.m3 = Masses(mass);
    Throwdists = Parametersweep(Angles, params);
    Results(mass, :) = Throwdists;
end

%% Plotting

params = parameters();
contour(Angles, Masses, Results, ...
    [params.distanceToPool - params.poolradius, params.distanceToPool + params.poolradius])

%mycmap = [0 0 0;0 1 0;0 0 0];
%colormap(mycmap);
%caxis([params.distanceToPool-10 params.distanceToPool+10 ])
xlabel('Trebuchet pin angle (degrees)')
ylabel('Rider mass (kg)')
title('Success region')