%% Calculating joint coordinates for animation purposes
l1 = .5
l2 = 1
l3 = 1.5

% It seems more natural for this data to be stored as P1 (containing x and
% y coords for the first point, P2 (etc.)
x = [l2*cos(Stocks(:,1)), l2*cos(Stocks(:,1))+l3*cos(Stocks(:,2)), l1*-cos(Stocks(:,1))];
y = [l2*sin(Stocks(:,1)), l2*sin(Stocks(:,1))+l3*sin(Stocks(:,2)), l1*-sin(Stocks(:,1))];

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
hh2 = plot([0, 0, x(1,1);x(1,3), x(1,1), x(1,2)], [0, 0, y(1,1);y(1,3), y(1,1), y(1,2)], ...
    '.-', 'MarkerSize', 20, 'LineWidth', 2);
axis equal
axis([-l2-l3 l2+l3 -l2-l3 l2+l3])
ht = title(sprintf('Time: %0.2f sec', Times(1)));

%% Get figure size
pos = get(gcf, 'Position');
width = pos(3);
height = pos(4);

%% Preallocate data (for storing frame data)
mov = zeros(height, width, 1, length(Times), 'uint8');

%% Loop through by changing XData and YData
for id = 1:length(Times)
    % Update graphics data. This is more efficient than recreating plots.
    set(hh1(1), 'XData', Times(id), 'YData', angles(id, 1))
    set(hh1(2), 'XData', Times(id), 'YData', angles(id, 2))
    set(hh2(1), 'XData', [0, x(id, 3)], 'YData', [0, y(id, 3)])
    set(hh2(2), 'XData', [0, x(id, 1)], 'YData', [0, y(id, 1)])
    set(hh2(3), 'XData', [x(id, 1), x(id, 2)], 'YData', [y(id, 1), y(id, 2)])
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