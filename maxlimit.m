function u = maxlimit(u,maxu)

if norm(u) > maxu
    if u<0
        u=-maxu;
    else
        u=maxu;
    end
end

    