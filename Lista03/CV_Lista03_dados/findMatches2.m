function matches = findMatches2(descriptors1, descriptors2, ratioThreshold)

    n1 = size(descriptors1,1);
    n2 = size(descriptors2,1);
    
    matches   = [];
    n 	      = min(n1,n2);
    
    for i = 1:n
        min_dist      = inf;
        sec_min_dist  = inf;
        min_index     = 0;

        for j = 1:n2
            if ~isempty(matches) && ismember(j,matches(:,2))
                continue
            else
                distance = norm(descriptors2(j,:) - descriptors1(i,:));
            end

            if distance < min_dist
                  sec_min_dist = min_dist;  
                  min_dist     = distance;
                  min_index    = j;
            elseif distance < sec_min_dist
                  sec_min_dist  = distance;
            end
        end
        if min_dist < ratioThreshold * sec_min_dist
            matches = [matches; i, min_index];
        end
    end
end
