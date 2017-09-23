function pks = pksdetect(s)
pks = find(diff(diff(s) > 0) < 0);
k = find(s(pks+1) > s(pks));
pks(k)=pks(k)+1;
end
