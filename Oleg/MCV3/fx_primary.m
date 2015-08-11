function output = fx_primary(x, xi, ns, f)

p   = zeros(1,ns);
q   = ones(1,ns);
ind = 1:ns;

for j = ind
    k = j;
    for j1 = ind
        if j1 ~= k
            p(j) = p(j) +  (x - xi(j1));
            q(j) = q(j) / (xi(k) - xi(j1));
        end % if
    end % for j1
end % for j

output = p ./ q .* f;

