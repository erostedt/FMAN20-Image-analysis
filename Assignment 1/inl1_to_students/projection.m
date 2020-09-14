function proj = projection(vec, bases)
% Author: Eric Rostedt

% Calculate the orthogonal projection for some matris onto the subspace
% spanned by some basis vectors.
[m, n] = size(vec);
proj = zeros(m, n);
for base = bases
    base = base{1};
    proj = proj + (sum(sum(vec .* base)) / norm(base, 'fro')) .* base;
end
end
