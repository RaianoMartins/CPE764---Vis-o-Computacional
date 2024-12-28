function plotMatches(img1, img2, keypoints1, keypoints2, matches)

    imgComposite = [img1, img2];
    
    figure;
    imshow(imgComposite);
    hold on;

    offsetX = size(img1, 2);
    
    max_x = size(imgComposite, 2);
    max_y = size(imgComposite, 1);

    for i = 1:size(matches, 1)
        pt1 = keypoints1(matches(i, 1), :);
        pt2 = keypoints2(matches(i, 2), :);
        pt2(1) = pt2(1) + offsetX;
        
        if pt1(1) > 0 && pt1(1) <= max_x && pt1(2) > 0 && pt1(2) <= max_y && ...
           pt2(1) > 0 && pt2(1) <= max_x && pt2(2) > 0 && pt2(2) <= max_y

            line([pt1(1), pt2(1)], [pt1(2), pt2(2)], 'Color', 'r', 'LineWidth', 0.05);
            plot(pt1(1), pt1(2), 'bo', 'MarkerSize', 3, 'LineWidth', 1.5);
            plot(pt2(1), pt2(2), 'bo', 'MarkerSize', 3, 'LineWidth', 1.5);
        end
    end

    hold off;
end


