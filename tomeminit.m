function tomeminit(W)
  filename="ldpc_mem_init.hex";
  fid=fopen(filename,"w");
  addr=0;
  for i=[1:size(W,2)]
    i
    fvals=find(W(:,i));
    for j=[1:size(fvals,1)]
      j
      
      data=fvals(j);%bittxor(bitget(bitshift(1,11),1:8),bitget(fvals(j),1:10))
      fvals
      if(j==size(fvals,1))
        fval_end=1;
      else
        fval_end=0;
      end
      data=bitset(data,11,fval_end);
      par=mod(sum(bitget(data,1:11)),2);
      data=bitset(data,12,par);
      data
      %data=uint16(data);
      data=swapbytes(uint16(data));
      addr_lsb=bitand(addr,2^8-1);
      addr_msb=bitshift(addr,-8);
      data_lsb=bitand(data,2^8-1);
      data_msb=bitshift(data,-8);
      chksm=2+addr_lsb+addr_msb+data_lsb+data_msb;
      chksm=bitxor(chksm,2^9-1)+1;
      chksm=uint16(bitand(chksm,2^8-1));
      fprintf(fid,":02%04x00%04x%02x\n",addr,data,chksm);
      addr=addr+2;
    endfor
  endfor
  fprintf(fid,":00000001FF");
  fclose(fid);
endfunction