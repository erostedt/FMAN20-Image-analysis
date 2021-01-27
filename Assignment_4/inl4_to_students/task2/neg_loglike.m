function log_like = neg_loglike(x, params)
log_like = -log(normpdf(x, params(1), params(2)));
end
