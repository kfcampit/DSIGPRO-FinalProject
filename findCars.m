function [diffImage, mask, parkedCars] = findCars(rgbEmptyImage, rgbTestImage, maskImage)
    diffImage = imabsdiff(rgbEmptyImage, rgbTestImage);
    diffImage = rgb2gray(diffImage);
    mask = min(maskImage, [], 3) == 255; % Max saturation
    diffImage(~mask) = 0; 

    kThreshold = 40;
    parkedCars = diffImage > kThreshold;
    parkedCars = imfill(parkedCars, 'holes');
    parkedCars = bwconvhull(parkedCars, 'objects');
end