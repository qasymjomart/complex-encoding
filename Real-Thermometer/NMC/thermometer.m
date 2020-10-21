function [therm_data] = thermometer(data)
    %data = table2array(data);
    [r, columns] = size(data);
    columns = [1:columns];
    therm_data = [];
    for c = columns
        un_values = unique(data(:,c));
        size_val = max(un_values);
        curr_data = [];
        for s = data(:,c)'
            curr_data = [curr_data; [ones(1, 1+s), zeros(1, size_val-s)]];
        end
        therm_data = [therm_data, curr_data];
    end
end