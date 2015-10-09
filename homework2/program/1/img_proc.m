function [area_array r_array c_array rr_array rc_array cc_array inertia_max_array angle_max_array, ...
    inertia_min_array angle_min_array circum_array circul_array] = img_proc(file, format, threshold, above_below) 
%%The image processing function: calculate area, centroid, inertia,
%%circumference, cicularity of the binary image
%%Parameter: file is the path of image(should be grey), format is the
%%format and threshold, if above_below >=0, it means the foreground is
%%greater than the threshold, otherwise not.
img_original = imread(file,format);
img_matrix = double(img_original);
%generate the binary image
%most pixels in image should be background

% if sum(img_matrix > threshold) > sum(img_matrix < threshold)
%   img_binary = img_matrix < threshold;
% else
%   img_binary = img_matrix > threshold;
% end
if above_below >= 0
  img_binary = img_matrix > threshold;
else
  img_binary = img_matrix < threshold;
end

img_binary = pepper_salt(img_binary);
figure();
imshow(img_original);
figure();
imshow(img_binary);
figure();
imshow(dilate(img_binary));
figure();
imshow(dilate(img_binary)-img_binary);
%connected object dection
img_processed = raster_scan_8(img_binary);
%
obj_array = unique(img_processed);
obj_array = reshape(obj_array,1,length(obj_array));
obj_array(obj_array == 0) = [];
%
area_array = [];
r_array = [];
c_array = [];
rr_array = [];
rc_array = [];
cc_array = [];
inertia_max_array = [];
angle_max_array = [];
inertia_min_array = [];
angle_min_array = [];
circum_array = [];
circul_array = [];
for i = obj_array
  if i == 0
    continue;
  end
  area_array = [area_array, sum(sum(img_processed == i))];
  [r c rr rc cc] = moments(img_processed == i);
  r_array = [r_array, r];
  c_array = [c_array, c];
  rr_array = [rr_array, rr];
  rc_array = [rc_array, rc];
  cc_array = [cc_array, cc];
  [inertia_max inertia_min angle_max angle_min] = inertia(rr, rc, cc);
  inertia_max_array = [inertia_max_array inertia_max];
  inertia_min_array = [inertia_min_array inertia_min];
  angle_max_array = [angle_max_array angle_max];
  angle_min_array = [angle_min_array angle_min];
  circum = circumference(img_processed == i);
  circum_array = [circum_array, circum];
  circul = circularity(img_processed == i);
  circul_array = [circul_array circul];
end
%circul_comp = circum_array.^2./area_array;
%print
fprintf('\nThe connected component analysis of image %s\n',file);
fprintf('Region number\t Area\t Centroid(r, c)\t Moments(rr, rc, cc)\t Inertia(max_angle, max, min_angle, min)\t Circularity\t Circumference\t \n');
for i = 1:length(area_array)
  fprintf('%d\t %d\t (%.2f, %.2f)\t (%.2f, %.2f, %.2f)\t (%.2f, %.2f, %.2f, %.2f)\t %.2f\t %.2f\t \n',i, area_array(i),r_array(i),c_array(i),rr_array(i),rc_array(i),cc_array(i)...
      ,angle_max_array(i),inertia_max_array(i),angle_min_array(i),inertia_min_array(i),circul_array(i),circum_array(i));
end




    