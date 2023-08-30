
%% Halley's Method Vs. Newton's Method
% Description: This code compares Halley's method and Newton's method, two
% numerical analysis techniques, by finding the square root of a given number.
% The comparison includes the maximum number of iterations and computational time.

% Inputs:
%   N       - The number whose square root is required
%   x0      - Initial Guess of square root
%   imax    - Maximum number of allowed iterations
%   error   - Maximum error allowed

% Outputs:
%   1.      Square root of given number calculated using Newton's and Halley's method.
%   2.      Number of iterations by each method to find the solution within the error bound.
%   3.      Time consumed by each method.

clc
clear 
close all

%% Inputs

% The number for which the square root is calculated
N = input('Enter the Number: ');

% Initial guess of the square root
x0 = input('Enter the Initial Guess: '); 

% Maximum number of iterations
imax = input('Enter the Maximum Iterations: '); 

% Error tolerance
error = input('Enter Maximum Error (e.g. 1e-3): ');

%% Function and its derivatives

% Function
f = @(x) x^2 - N;

% 1st Derivative 
f_p = @(x) 2*x;

% 2nd Derivative
f_dp = @(x) 2;

%% Method Implementation

% Iteration Counter for Newton's Method
iteration_newton = 1;

% Iteration Counter for Halley's Method
iteration_halley = 1;

% Error variable for Newton's Method
error_newton = inf;

% Error variable for Halley's Method
error_halley = inf;

% Perform iterations for Newton's Method
tic
while (error_newton > error && iteration_newton < imax)
    xn = x0 - f(x0) / f_p(x0);
    error_newton = abs(xn - x0);
    x0 = xn;
    iteration_newton = iteration_newton + 1; 
end
fprintf('\n\n***** Newton''s Method *****\n')
fprintf('The Square root of %0.2f is %0.4f.\n', N, xn);
fprintf('Total Iterations = %d\n', iteration_newton)
toc

% Perform iterations for Halley's Method
tic
while (error_halley > error && iteration_halley < imax)
    xn = x0 - (2*f(x0)*f_p(x0)) / (2*f_p(x0)^2 - f(x0)*f_dp(x0));
    error_halley = abs(xn - x0);
    x0 = xn;
    iteration_halley = iteration_halley + 1;
end
fprintf('\n\n***** Halley''s Method *****\n')
fprintf('The Square root of %0.2f is %0.4f.\n', N, xn);
fprintf('Total Iterations = %d\n', iteration_halley)
toc

