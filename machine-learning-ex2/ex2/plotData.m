function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
New_mat=[X y];
positive=New_mat(New_mat(:,3)==1,:);
negative=New_mat(New_mat(:,3)==0,:);
w=positive(:,1);
z=positive(:,2);
plot(w,z,'k+');

e=negative(:,1);
q=negative(:,2);
plot(e,q,'ko');










% =========================================================================



hold off;

end
