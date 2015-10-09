%Computer Vision, Hw2, Prolem 1
%The main function of connected component extraction
% %for image 'hw2-3A' and 'my', threshold should be 135
% %for image 'hw2-2A' and 'hw2-2B', threshold should be 55
% %

clear all;
file = 'my';
format = 'jpg';
threshold = 135;
[area_array r_array c_array rr_array rc_array cc_array inertia_max_array angle_max_array, ...
    inertia_min_array angle_min_array circum_array circul_array] = img_proc(file,format,threshold, -1);

report = [[1:length(area_array)];area_array;r_array;c_array;rr_array;rc_array;cc_array;angle_max_array;inertia_max_array;angle_min_array;inertia_min_array;circul_array;circum_array];
report = report';

% %Obsolete
% %First read the image file, the file should be a grey image
% img_original = imread('my','jpg');
% img_matrix = double(img_original);
% % %first ascertain the threshold
% img_vector = reshape(img_matrix, prod(size(img_matrix)),1);
% %%The number of containers in pdf estimation, this parameter determines the success of curve fitting, and need to be adjusted manually 
% m = 30;
% %%
% [prob x] = hist(double(img_vector),m);
% prob = prob/length(img_vector);
% f = fit(x.',prob.','gauss2');
% figure;
% plot(f,x,prob);
% a1=f.a1;
% b1=f.b1;
% c1=f.c1;
% a2=f.a2;
% b2=f.b2;
% c2=f.c2;
% A=c2^2-c1^2;
% B=2*b2*c1^2-2*b1*c2^2;
% C=c2^2*b1^2-c1^2*b2^2-c1^2*c2^2*log(a1/a2);
% threshold1 = (-B-sqrt(B^2-4*A*C))/A/2;
% threshold2 = (-B+sqrt(B^2-4*A*C))/A/2;
% m1 = min(b1, b2);
% m2 = max(b1, b2);
% if threshold1 > m1 && threshold1 < m2
%     threshold = threshold1;
% else
%     threshold = threshold2;
% end
% threshold = 55;
% %for image 'hw2-3A', threshold should be 135
% %for imgae 'hw2-2A' and 'hw2-2B', threshold should be 55
% %generate the binary image
% %most pixels in image should be background
% if sum(img_matrix > threshold) > sum(img_matrix < threshold)
%   img_binary = img_matrix < threshold;
% else
%   img_binary = img_matrix > threshold;
% end
% figure();
% imshow(img_binary);
% figure();
% imshow(dilate(img_binary));
% figure();
% imshow(dilate(img_binary)-img_binary);
% %connected object dection
% img_processed = raster_scan(img_binary);
% %
% obj_array = unique(img_processed);
% obj_array = reshape(obj_array,1,length(obj_array));
% obj_array(obj_array == 0) = [];
% %
% area_array = [];
% r_array = [];
% c_array = [];
% rr_array = [];
% rc_array = [];
% cc_array = [];
% inertia_max_array = [];
% angle_max_array = [];
% inertia_min_array = [];
% angle_min_array = [];
% circum_array = [];
% circul_array = [];
% for i = obj_array
%   if i == 0
%     continue;
%   end
%   area_array = [area_array, sum(sum(img_processed == i))];
%   [r c rr rc cc] = moments(img_processed == i);
%   r_array = [r_array, r];
%   c_array = [c_array, c];
%   rr_array = [rr_array, rr];
%   rc_array = [rc_array, rc];
%   cc_array = [cc_array, cc];
%   [inertia_max inertia_min angle_max angle_min] = inertia(rr, rc, cc);
%   inertia_max_array = [inertia_max_array inertia_max];
%   inertia_min_array = [inertia_min_array inertia_min];
%   angle_max_array = [angle_max_array angle_max];
%   angle_min_array = [angle_min_array angle_min];
%   circum = circumference(img_processed == i);
%   circum_array = [circum_array, circum];
%   circul = circularity(img_processed == i);
%   circul_array = [circul_array circul];
% end
%circul_comp = circum_array.^2./area_array;






    