function [Y_ext, Y_cnt] = rmc_aux(V,n0,n1,mask)
%this function is different with the tongyong edition.
Y_ext = spm_read_vols(V);
Y_cnt = Y_ext(:,:,n0:n1);
Y_cnt = sum(Y_cnt,3);
Y_cnt = Y_cnt.*mask;
for kk = 1:size(Y_ext,3)
    Y_ext(:,:,kk) = Y_ext(:,:,kk).*mask;
end