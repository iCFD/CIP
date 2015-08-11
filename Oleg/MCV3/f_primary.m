function output = f_primary(x, xi, ns, f)

p   = ones(1,ns);
ind = 1:ns;

for j = ind
    k = j;
    for j1 = ind
        if j1 ~= k
            p(j) = p(j) * (x - xi(j1)) / (xi(k) - xi(j1));
        end % if
    end % for j1
end % for j

output = p .* f;

