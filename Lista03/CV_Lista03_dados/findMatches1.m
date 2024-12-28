function matches = findMatches1(descriptors1, descriptors2)

    n1 = size(descriptors1,1);
    n2 = size(descriptors2,1);
    
    matches   = [];
    n 	      = min(n1,n2);
    
    for i = 1:n
        min_dist = inf;
        min_index = 0;

        for j = 1:n2
            if ~isempty(matches) && ismember(j,matches(:,2))
                continue
            end
            distance = norm(descriptors2(j,:) - descriptors1(i,:));
            if distance < min_dist
                  min_dist = distance;
                  min_index = j;
            end
        end
        
        matches = [matches; i, min_index];
    end
end

