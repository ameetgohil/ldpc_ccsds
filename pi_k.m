function val=pi_k(i,k,M,thetak,phik)
%th=thetak(k)
%ph=phik(k,log2(M),floor(4*i/M)+ 1)
%a=mod(th+floor(4*i/M),4)
%b=ph+i
%c=mod(a+b,M/4)
%d=(M/4)*c
val=(M/4)*mod(mod((thetak(k)+floor(4*i/M)),4) + (phik(k,log2(M),floor(4*i/M)+1)+i),M/4);
%val=phik(k,M,
endfunction
