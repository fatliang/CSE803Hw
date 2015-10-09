%Computer Vision, Hw2, Prolem 2
%First read the image file, the file should be a grey image
img_A = imread('hw2-2A','jpg');
img_B = imread('hw2-2B','jpg');
threshold = 55;
%for imgae 'hw2-2A' and 'hw2-2B', threshold should be 55
%generate the binary image
%most pixels in image should be background
if sum(img_A > threshold) > sum(img_A < threshold)
  img_A_bin = img_A < threshold;
  img_B_bin = img_B < threshold;
else
  img_A_bin = img_A > threshold;
  img_B_bin = img_B > threshold;
end
figure();
imshow(img_A_bin);
figure();
imshow(img_B_bin);
%connected object dection
img_A_processed = raster_scan_8(img_A_bin);
img_B_processed = raster_scan_8(img_B_bin);
%
obj_array_A = unique(img_A_processed);
obj_array_A = reshape(obj_array_A,1,length(obj_array_A));
obj_array_A(obj_array_A == 0) = [];
obj_array_B = unique(img_B_processed);
obj_array_B = reshape(obj_array_B,1,length(obj_array_B));
obj_array_B(obj_array_B == 0) = [];
%
area_A_array = [];
r_A_array = [];
c_A_array = [];
for i = obj_array_A
  if i == 0
    continue;
  end
  area_A_array = [area_A_array, sum(sum(img_A_processed == i))];
  [r c rr rc cc] = moments(img_A_processed == i);
  r_A_array = [r_A_array, r];
  c_A_array = [c_A_array, c];
end
%
area_B_array = [];
r_B_array = [];
c_B_array = [];
for i = obj_array_B
  if i == 0
    continue;
  end
  area_B_array = [area_B_array, sum(sum(img_B_processed == i))];
  [r c rr rc cc] = moments(img_B_processed == i);
  r_B_array = [r_B_array, r];
  c_B_array = [c_B_array, c];
end
%the object 1 and 2 correspond to object 2 and 4
[sita u0 v0] = rotANDtrans(r_B_array(1),c_B_array(1),r_B_array(2),c_B_array(2),r_A_array(2),c_A_array(2),r_A_array(4),c_A_array(4));
centroid_map = [cos(sita),-sin(sita);sin(sita),cos(sita)]*[c_B_array;r_B_array]+[v0*ones(1,length(r_B_array));u0*ones(1,length(r_B_array))];
report_A = [obj_array_A;area_A_array;r_A_array;c_A_array];
report_A = report_A'
report_B = [obj_array_B;area_B_array;r_B_array;c_B_array];
report_B = report_B'
centroid_map = [centroid_map(1,:);centroid_map(2,:)];
report_map = [obj_array_B;centroid_map];
report_map = report_map'


%circul_comp = circum_array.^2./area_array;






    