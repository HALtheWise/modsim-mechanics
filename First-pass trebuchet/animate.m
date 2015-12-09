function res = animate(Times, Stocks, params)
%%Calculate positions from params
    p = params;

    theta1 = Stocks(:,1);
    theta2 = Stocks(:,2);
    
    P0 =        zeros(length(Stocks(:,1)), 2);
    P1 =        [p.l1*-cos(theta1), p.l1*-sin(theta1)];
    P2 =        [p.l2*cos(theta1), p.l2*sin(theta1)];
    P3 = P2 +   [p.l3*cos(theta2), p.l3*sin(theta2)];
    

%% Assign joint coordinates
x = [P1(:,1), P0(:,1), P2(:,1), P3(:,1)];
y = [P1(:,2), P0(:,2), P2(:,2), P3(:,2)];

%% Convert radians to degrees
angles = Stocks(:,1:2) * (180/pi);

%% Set up first frame
figure('Color', 'white')
subplot(2,1,1)
plot(Times, angles, 'LineWidth', 2)
hh1(1) = line(Times(1), angles(1,1), 'Marker', '.', 'MarkerSize', 20, ...
    'Color', 'b');
hh1(2) = line(Times(1), angles(1,2), 'Marker', '.', 'MarkerSize', 20, ...
    'Color', 'r');
xlabel('time (sec)')
ylabel('angle (deg)')
subplot(2,1,2)
hh2 = plot([x(1,1), x(1,2), x(1,3);x(1,2), x(1,3), x(1,4)], [y(1,1), y(1,2), y(1,3);y(1,2), y(1,3), y(1,4)], ...
    '.-', 'MarkerSize', 20, 'LineWidth', 2);
axis equal
axis((p.l2+p.l3).*[-1 1 -1 1])
ht = title(sprintf('Time: %0.2f sec', Times(1)));

%% Get figure size
%pos = get(gcf, 'Position');
%width = pos(3);
%height = pos(4);

%% Preallocate data (for storing frame data)
%mov = zeros(height, width, 1, length(Times), 'uint8');

%% Loop through by changing XData and YData
for id = 1:length(Times)
    % Update graphics data. This is more efficient than recreating plots.
    set(hh1(1), 'XData', Times(id), 'YData', angles(id, 1))
    set(hh1(2), 'XData', Times(id), 'YData', angles(id, 2))
    set(hh2(1), 'XData', [x(id, 1), x(id, 2)], 'YData', [y(id, 1), y(id, 2)])
    set(hh2(2), 'XData', [x(id, 2), x(id, 3)], 'YData', [y(id, 2), y(id, 3)])
    set(hh2(3), 'XData', [x(id, 3), x(id, 4)], 'YData', [y(id, 3), y(id, 4)])
    set(ht, 'String', sprintf('Time: %0.2f sec', Times(id)))
    
    % Get frame as an image
    f = getframe(gcf);
    
    % Create a colormap for the first frame. For the rest of the frames,
    % use the same colormap
%     if id == 1
%         [mov(:,:,1,id), map] = rgb2ind(f.cdata, 256, 'nodither');
%     else
%         mov(:,:,1,id) = rgb2ind(f.cdata, map, 'nodither');
%     end
%     keyboard
end

%% Create animated GIF
% imwrite(mov, map, 'animation.gif', 'DelayTime', 0, 'LoopCount', inf)
end