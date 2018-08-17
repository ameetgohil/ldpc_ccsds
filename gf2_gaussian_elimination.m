function out=gf2_gaussian_elimination(in)
  rows=size(in,1);
  cols=size(in,2);
  out=[in eye(rows)];
  f=0;
  for i=[1:rows-1]
    temprow=out(i,:);
    f=i+find(out(i:rows,i),1)-1;
    out(i,:)=out(f,:);
    out(f,:)=temprow;
    for r=[i+1:rows]
      if(out(r,i)==1)
        out(r,:)=mod(out(i,:)+out(r,:),2);
      endif
    endfor
  endfor
  for i=[rows:-1:2]
    for r=[i-1:-1:1]
 %   i
%    r
      if(out(r,i)==1)
        out(r,:)=mod(out(i,:)+out(r,:),2);
      endif
    endfor
  endfor
  out=out(:,cols+1:size(out,2));
endfunction