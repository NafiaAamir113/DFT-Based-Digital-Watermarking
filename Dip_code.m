[filename, pathname] = uigetfile('*','Pick an Image');
if isequal(filename, 0)
    return;  
end
original_image = imread(fullfile(pathname, filename));
original_image = double(original_image);
image_frequency_domain = fft2(original_image);
%Generate watermark
watermark = randi([0, 1], size(original_image));
watermark = double(watermark);
watermark_frequency_domain = fft2(watermark);
% Alpha blending factor
alpha = 0.4;

% Embed watermark in the frequency domain
watermarked_image_frequency_domain = image_frequency_domain + alpha * watermark_frequency_domain;
watermarked_image = ifft2(watermarked_image_frequency_domain);

% Display the original, watermark, watermarked image, and frequency domain images
figure;

subplot(2,2, 1);
imshow(uint8(original_image));
title('Original Image');

subplot(2,2, 2);
imshow(watermark, []);
title('Watermark');

subplot(2, 2, 3);
imshow(uint8(abs(watermarked_image)));
title('Watermarked Image');

subplot(2, 2, 4);
imshow(log(1 +watermarked_image ), []);
title('Frequency Domain Representation');

% Check if watermark is present
mse = norm(original_image(:) - watermarked_image(:), 'fro')^2 / numel(original_image);
if mse > 1e-6
    watermark_presence = 'Watermark is present';
else
    watermark_presence = 'Watermark is not present';
end

% Display the watermark presence information below the images
figure;
subplot(1,1,1);
axis off;
text(0.5, 0.3, watermark_presence, 'Color', 'black', 'FontSize', 14, 'HorizontalAlignment', 'center');

