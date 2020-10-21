function error = NMC_error(X0Test, X1Test, m0, m1, alpha0)

    e0 = 0;
    for i = 1:size(X0Test,2)
        pl = NMC(m0, m1, X0Test(:,i)', alpha0);
        if (pl==1)
            e0 = e0 + 1;
        end
    end
    e0=e0/size(X0Test,2);
    e1 = 0;
    for i = 1:size(X1Test,2)
        pl = NMC(m0, m1, X1Test(:,i)', alpha0);
        if (pl==0)
            e1 = e1 + 1;
        end
    end
    e1=e1/size(X1Test,2);
    error = alpha0*e0+(1-alpha0)*e1;
end