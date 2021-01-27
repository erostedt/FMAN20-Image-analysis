% Task 1: Fit least squares and total least squares lines to data points.

% Clear up
clc;
close all;
clearvars;

% Begin by loading data points from linjepunkter.mat
load linjepunkter

N = length(x); % number of data points

% Plot data
plot(x, y, '*'); hold on;
xlabel('x') 
ylabel('y')
title('Line fitting') % OBS - CHANGE TITLE!
x_fine = [min(x)-0.05,max(x)+0.05]; % used when plotting the fitted lines

% Solve ordinary least square:
p_ls = solve_OLS(x, y);
plot(x_fine, p_ls(1) * x_fine + p_ls(2))

% Solve total least square:
p_tls = solve_TLS(x, y);
plot(x_fine, p_tls(1) * x_fine + p_tls(2), 'k--')

% Legend --> show which line corresponds to what (if you need to
% re-position the legend, you can modify rect below)
h=legend('data points', 'least-squares','total-least-squares');
rect = [0.20, 0.65, 0.25, 0.25];
set(h, 'Position', rect)

% Errors:

% For LS-line:
OLS_line_OLS_error = error_OLS(p_ls, x, y);
TLS_line_OLS_error = error_OLS(p_tls, x, y);

% For TLS-line:
OLS_line_TLS_error = error_TLS(p_ls, x, y);
TLS_line_TLS_error = error_TLS(p_tls, x, y);

fprintf('Least square error for ls line: %2.2f \nLeast square error for tls line: %2.2f \n \n', OLS_line_OLS_error, TLS_line_OLS_error)
fprintf('Total least square error for ls line: %2.2f \nTotal least square error for tls line: %2.2f\n', OLS_line_TLS_error, TLS_line_TLS_error)




















