function visualizeSpaces(rgbTestImage, props, centroids, percentageFilled, fontSize)
    freeLabel = "0";
    parkedLabel = "0";

    hFig2 = figure;
    imshow(rgbTestImage);
    hFig2.WindowState = 'maximized';
    hFig2.Name = 'Available Parking with Counter';
    hold on;
    parkedCount = 0;
    freeCount = 0;
    for k = 1 : length(props)
        x = centroids(k, 1);
        y = centroids(k, 2);
        blobLabel = sprintf('%d', k);
        if props(k).Area > 100
            if percentageFilled(k) > 0.40
                parkedCount = parkedCount + 1;
                parkedLabel = sprintf('%d',parkedCount);
                %plot(x, y, 'rx', 'MarkerSize', 30, 'LineWidth', 4);
                %img = imcrop(rgbTestImage, props(k).BoundingBox);
                %lpr = getLicensePlate(img);
                text(x, y + 20, parkedLabel, 'Color', 'r', 'FontSize', 15, 'FontWeight', 'bold');
                rectangle('Position', props(k).BoundingBox, 'EdgeColor', 'r','LineWidth',1);
            else
                freeCount = freeCount + 1;
                freeLabel = sprintf('%d',freeCount);
                %plot(x, y, 'g.', 'MarkerSize', 40, 'LineWidth', 4);
                rectangle('Position', props(k).BoundingBox, 'EdgeColor', 'g','LineWidth',1);
            end
        end
    end
    text(25, 25, strcat("Available: ",freeLabel), 'Color', 'g', 'FontSize', 30, 'FontWeight', 'bold');
    text(25, 60, strcat("Taken: ",parkedLabel), 'Color', 'r', 'FontSize', 30, 'FontWeight', 'bold');

    title('Marked Spaces. Green Spot = Available. Red X = Taken.', 'FontSize', fontSize);
end