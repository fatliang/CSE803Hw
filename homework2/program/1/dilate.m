function res = dilate(img)
%img is binary image
img = logical(img);
img_size = size(img);
res = zeros(img_size);
img_expand = [img(1,:);img;img(end,:)];
img_expand = img_expand';
img_expand = [img_expand(1,:);img_expand;img_expand(end,:)];
img_expand = img_expand';
for i = 1:img_size(1)
  for j = 1:img_size(2)
    %the corresponding position in img_expand is (i+1,j+1)
    judge = sum(sum(img_expand(i:i+2,j:j+2)));
    if judge ~= 0
      res(i,j) = 1;
    end
  end
end
res = logical(res);