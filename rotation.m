function [rotated_img] = rotation(input_img, eye_left, eye_right)
% xcoord = (:,1)
% ycoord = (:,2)

%rotate the image so that the eyes are at equal height
%Find center of image
[nx,ny] = size(input_img)
center = round([nx ny]/2)

%Find distance between left eye and center (xpos)
dist_to_center_x = abs(eye_left(:,1)-center(:,1))
dist_to_center_y = abs(eye_left(:,2)-center(:,2))

rectangle('Position', [eye_left(:,1), eye_left(:,2), 15, 15], 'EdgeColor', 'b', 'LineWidth', 2)
%Pad the image so we dont lose information in later steps
%padded = padarray(input_img, [dist_to_center_x,dist_to_center_y], 0, 'both')
padded = padarray(input_img, [250,250], 0);
imshow(padded);

%Move left eye to center
translated_img = imtranslate(padded, [0, dist_to_center_y]); %x and y pos
imshow(translated_img)



%Find what angle we should rotate
%Hitta x-avståndet mellan ögonen
  distance_in_x = eye_left(:,1) - eye_right(:,1) %a
  a = distance_in_x;
%Hitta y-avståndet mellan ögonen
  distance_in_y = eye_left(:,2) - eye_right(:,2) %b
  b = distance_in_y;

%Hitta hypotenusan för att få en triangel
  hypo = hypot(distance_in_x, distance_in_y); %h
  h = hypo;
%Använd trig-funktion för att få fram vinkeln
  rotation_angle = rad2deg(asin(distance_in_y/hypo)) %v

%if left eye is higher than right eye: 
    %rotate coutner-clockwise
%else if right eye is higher than left eye
    %rotate clockwise

    if(eye_left(:,2) > eye_right(:,2))
        rotated_img = imrotate(input_img, -rotation_angle);
    else
        rotated_img = imrotate(input_img, rotation_angle);
    end

% Padda bildne med svart eller vitt å vi inte tappar information
%     Hitta mittpunkten
%     Hitta avståndet mellan vänsterögat och mitten
%     Tranlatera vänsterögat så det hamnar i mitten
%     rotera bilden (eftersom vänsterögat är i mitten blir det rätt rotation)
%     nu vet man vart vänsterögat är och kan cropa bilden efter detta


%gör om till degrees froån radianer 

end