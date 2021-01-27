function classification_data = class_train(X, Y)
% Append Y to X and use last col as class.
classification_data = vertcat(X, Y);
end

