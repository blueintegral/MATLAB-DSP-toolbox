function [x_hwr_OUT]=halfWaveRectify_SlowVersion(x_vector_IN)

if((size(x_vector_IN,1)~=1) && (size(x_vector_IN,2)~=1))
  error(['Input must be a vector'])
end
x_hwr_OUT=x_vector_IN;

for(ii=1:length(x_hwr_OUT))
  if(x_hwr_OUT(ii)<0)
    x_hwr_OUT(ii)=0;
  end
end

return
