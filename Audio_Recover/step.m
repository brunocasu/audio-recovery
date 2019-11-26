function s=step(n, n0)

s=zeros(1, length(n));
s(find(n==n0):end)=1;

end