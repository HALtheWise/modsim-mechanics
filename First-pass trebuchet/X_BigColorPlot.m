%% Calculating
Masses = linspace(1,100,20);
Angles = linspace(-100,0,500)*pi/180;
SparseResults = zeros(length(Masses), length(Angles));

for mass = 1:length(Masses)
    params = parameters();
    params.m3 = Masses(mass);
    Throwdists = X_PinAngleSweep(Angles, params);
    SparseResults(mass, :) = Throwdists;
end

%% Densify results
DenseMasses = linspace(min(Masses), max(Masses), 500);
DenseResults = interp2(Angles, Masses, SparseResults, Angles, DenseMasses', 'cubic');

%% Plotting

params = parameters();
contour(Angles, DenseMasses, DenseResults, ...
    [params.distanceToPool - params.poolradius, params.distanceToPool + params.poolradius])

%mycmap = [0 0 0;0 1 0;0 0 0];
%colormap(mycmap);
%caxis([params.distanceToPool-10 params.distanceToPool+10 ])
xlabel('Trebuchet pin angle (degrees)')
ylabel('Rider mass (kg)')
title('Success region')