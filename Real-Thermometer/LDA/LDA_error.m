function [true_error, error] = LDA_error(XTe0, XTe1, m0, m1, ci, alpha0)

    e0 = 0;
    for i = 1:size(XTe0,2)
        pl = LDA_test(XTe0(:,i), m0, m1, ci, alpha0);
        if (pl==1)
            e0 = e0 + 1;
        end
    end
    e0=e0/size(XTe0,2);
    
    e1 = 0;
    for i = 1:size(XTe1,2)
        pl = LDA_test(XTe1(:,i), m0, m1, ci, alpha0);
        if (pl==0)
            e1 = e1 + 1;
        end
    end
    e1=e1/size(XTe1,2);
    true_error = (e0*size(XTe0,2)+e1*size(XTe1,2))/(size(XTe1,2)+size(XTe0,2));
%     e0*size(XTe0,2)
%     e1*size(XTe1,2)
    error = alpha0*e0+(1-alpha0)*e1;
end