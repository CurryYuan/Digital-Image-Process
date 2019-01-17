function f = WienerFilter(g, H, k)
    G = fft2(Centralize(g));
    H2 = H .* conj(H);
    F = (G .* H2) ./ (H .* (H2 + k));
    f = ifft2(F);
    f = real(f);
    f = Centralize(f);
end