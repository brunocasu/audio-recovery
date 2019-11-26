function h = LPF(df, fc, fs)
N=0.91/(df/fs);
N=ceil(N);
rest=rem(N,2);

if rest==0
    N=N+1;
end

n=((-N+1)/2):((N-1)/2);
n(n==0) = 1e-10;

h=(1/pi)*((sin(2*pi*(fc/fs).*n))./n);

end