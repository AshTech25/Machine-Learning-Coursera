function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

h=1./(1+exp(-X*theta));
lr=(lambda/(2*m))*sum((theta(2:length(theta))).^2);
J=(-1/m)*sum((y(2:length(h)).*log(h(2:length(h))))+((1-y(2:length(h))).*log(1-h(2:length(h)))))+lr;
J=J+((-1/m)*(y(1).*log(h(1)))+((1-y(1)).*log(1-h(1))));


gr=(lambda/m)*theta(2:length(theta));
g=(h-y)'*X;
g=g';

grad(1)=(1/m)*g(1);
grad(2:length(g))=((1/m).*g(2:length(g)))+gr;





% =============================================================

end
