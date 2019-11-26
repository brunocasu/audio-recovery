function h = PASS_BAND(df, fcsup, fcinf, fs)

h1 = HPF(df, fcinf, fs);
h2 = LPF(df, fcsup, fs);

h = conv(h1,h2);

end