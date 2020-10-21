function error = CLDA_error(XTe0, XTe1, m0, m1, c, ci, p1)

    e0 = 0;
    for i = 1:size(XTe0,2)
        predict = CLDA_test(XTe0(:,i), m0, m1, c, ci, p1);
        if (predict==1)
            e0 = e0 + 1;
        end
    end
    e0=e0/size(XTe0,2);
    
    e1 = 0;
    for i = 1:size(XTe1,2)
        predict = CLDA_test(XTe1(:,i), m0, m1, c, ci, p1);
        if (predict==0)
            e1 = e1 + 1;
        end
    end
    e1=e1/size(XTe1,2);

    error = (1-p1)*e0 + p1*e1;
    
end