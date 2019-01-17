function f_inv = InverseFilter(g, H)
    [height, width] = size(g);
    G = fft2(Centralize(g));
    B = BLPF(50, 2, height, width);

    for u = 1 : height
        for v = 1 : width
            if abs(H(u, v)) < 0.001
                tmp = 1;
            else
                tmp = H(u, v);
            end
            F(u, v) = G(u, v) * B(u, v) / tmp;
        end
    end

    f_inv = ifft2(F);
    f_inv = real(f_inv);
    f_inv = Centralize(f_inv);
end