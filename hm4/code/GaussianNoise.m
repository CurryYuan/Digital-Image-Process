function gn = GaussianNoise(g, mean, var)
    [height, width] = size(g);
    noise = norminv(rand(height, width), mean, sqrt(var));
    gn = noise + double(normalize(g));
end
