%1 Collect faces for training
file_dir = fullfile('./DB0', '*.jpg');
all_files = dir(file_dir);

%1 Normalization function
for i = 1:length(all_files)

    file_name = fullfile(all_files(i).folder, all_files(i).name);
    img = imread(file_name);
    
    %Normalize face
    %find eye coordinates for left and right
    norm_face = normalization_face(left_eye, right_eye, img);

    img = rgb2gray(norm_face);

    % x vector
    x_i = crop_face(right_eye, left_eye, img);
    
    
end



%1 Same size n = rows x cols

%2 Each image as a n-vector x

%3 Find average face vector

%4 Subtract mean for each face vector

%5 Find covariance matrix, C
% C = A A'
% A = n x M
% C = c x c

%6a Eigenvectors for C, need to reduce C

%6b Consider C = A' A instead

%6c 

