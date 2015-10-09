function res = pepper_salt(img)
%img should be binary 
img = logical(img);
img_size = size(img);
res = img;
for i = 1:img_size(1)
  for j = 1:img_size(2)
    neighbor_pos = [i-1,j-1;i-1,j;i-1,j+1;i,j-1;i,j+1;i+1,j-1;i+1,j;i+1,j+1];
    neighbor_pos(neighbor_pos(:,1)<1,:) = [];
    neighbor_pos(neighbor_pos(:,1)>img_size(1),:) = [];
    neighbor_pos(neighbor_pos(:,2)<1,:) = [];
    neighbor_pos(neighbor_pos(:,2)>img_size(2),:) = [];
    neighbor_num = length(neighbor_pos);
    neighbor = [];
    for k = 1:neighbor_num
      neighbor = [neighbor, img(neighbor_pos(k,1),neighbor_pos(k,2))]; 
    end
    uni = unique(neighbor);
    if length(uni) == 1
      res(i,j) = uni;
    end
  end
end