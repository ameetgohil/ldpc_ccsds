function out=gf2_multiply(a,b)
 for r=[1:size(a,1)]
  for c=[1:size(b,2)]
    out(r,c)=mod(sum(a(r,:).*b(:,c)'),2);
  endfor
 endfor
endfunction