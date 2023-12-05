function [props, centroids, percentageFilled, area] = measurePixels(mask, parkedCars)
    props = regionprops(mask, parkedCars, 'MeanIntensity', 'Centroid', 'BoundingBox','Area','Image');
    centroids = vertcat(props.Centroid);
    percentageFilled = [props.MeanIntensity];
    area = [props.Area];
end