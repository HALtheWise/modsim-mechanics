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
clf
hold on
params = parameters();
[C1, h1] = contour(Angles, DenseMasses, DenseResults, ...
    [params.distanceToPool - params.poolradius,params.distanceToPool - params.poolradius], 'k');
[C2, h2] = contour(Angles, DenseMasses, DenseResults, ...
    [params.distanceToPool + params.poolradius, params.distanceToPool + params.poolradius], 'k');

fill(C1(1,2:end), C1(2,2:end), 'green')
fill(C2(1,2:end), C2(2,2:end), 'red')
set(gca, 'Color', 'yellow')

%mycmap = [0 0 0;0 1 0;0 0 0];
%colormap(mycmap);
%caxis([params.distanceToPool-10 params.distanceToPool+10 ])
xlabel('Trebuchet pin angle (degrees)')
ylabel('Rider mass (kg)')
title('Success region')