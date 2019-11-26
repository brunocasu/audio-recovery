function h = REJECT_BAND(df, fcsup, fcinf, fs)
N=0.91/(df/fs);
N=ceil(N);
rest=rem(N,2);

if rest==0
    N=N+1;
end

n=(-N+1):(N-1);
imp=pulse(n,0);

h = PASS_BAND(df, fcsup, fcinf, fs);

h = imp - h;

end