function [parked, avail] = visualizeSpaces(rgbTestImage, props, centroids, percentageFilled)
    hFig2 = figure(1);
    imshow(rgbTestImage);
    hFig2.WindowState = 'maximized';
    hFig2.Name = 'Available Parking with Counter';
    hold on;
    parkedCount = 0;
    freeCount = 0;

    parked = [];
    avail = [];

    for k = 1 : length(props)
        x = centroids(k, 1);
        y = centroids(k, 2);

        if props(k).Area > 100
            if percentageFilled(k) > 0.40
                parked = [parked k];

                parkedCount = parkedCount + 1;
                parkedLabel = sprintf('%d',k);
                text(x, y + 20, parkedLabel, 'Color', 'r', 'FontSize', 15, 'FontWeight', 'bold');
                rectangle('Position', props(k).BoundingBox, 'EdgeColor', 'r','LineWidth',1);
            else
                avail = [avail k];

                freeCount = freeCount + 1;
                freeLabel = sprintf('%d',k);
                text(x, y + 20, freeLabel, 'Color', 'g', 'FontSize', 15, 'FontWeight', 'bold');
                rectangle('Position', props(k).BoundingBox, 'EdgeColor', 'g','LineWidth',1);
            end
        end
    end

    text(25, 15, strcat("Available: ",sprintf('%d',freeCount)), 'Color', 'g', 'FontSize', 24, 'FontWeight', 'bold');
    text(25, 28, strcat("Taken: ",sprintf('%d',parkedCount)), 'Color', 'r', 'FontSize', 24, 'FontWeight', 'bold');

    title('Marked Spaces. Green Spot = Available. Red = Taken.', 'FontSize', 12);
end