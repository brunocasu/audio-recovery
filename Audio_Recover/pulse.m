function p=pulse(n, n0)

p=zeros(1, length(n));
p(find(n==n0))=1;
end