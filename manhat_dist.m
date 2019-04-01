function mh_dist = manhat_dist(U,v)
    mh_dist = sum(sqrt((U-v).^2), 2)'
end