function [x_hwr_OUT]=halfWaveRectify_Vectorized(x_vector_IN)

if((size(x_vector_IN,1)~=1) && (size(x_vector_IN,2)~=1))
end

x_hwr_OUT=x_vector_IN;
idxs_x_lt_zero=find(x_vector_IN<0);
x_hwr_OUT(idxs_x_lt_zero)=zeros(size(idxs_x_lt_zero));

return
