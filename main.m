clc;
close all;
clearvars;
format long g;
format compact;
fontSize = 16;

fileName = "test-img/testlp1.jpg";
im = imread(fileName);
im = imresize(im, [512 512]);

rgbTestImage = imread("filled-parking.jpg");
rgbEmptyImage = imread("empty-parking.jpg");
maskImage = imread("mask-parking.jpg");

% Find cars
[diffImage, mask, parkedCars] = findCars(rgbEmptyImage, rgbTestImage, maskImage);

% Measure the percentage of white pixels within each rectangular mask
[props, centroids, percentageFilled] = measurePixels(mask, parkedCars);

% Visualize parking spaces
visualizeSpaces(rgbTestImage, props, centroids, percentageFilled, fontSize);