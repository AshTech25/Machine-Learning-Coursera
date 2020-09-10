
function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions
    predictions=(pval<epsilon);
    TP=0;
    FP=0;
    FN=0;
    for i=1:size(yval,1)
      if(predictions(i)==1 && yval(i)==1)
      TP=TP+1;
      elseif(predictions(i)==1 && yval(i)==0)
      FP=FP+1;
      elseif(predictions(i)==0 && yval(i)==1)
      FN=FN+1;
      endif
    endfor
    if(TP+FP != 0)
      P=TP/(TP+FP);
    else 
      P=0;
    endif
    if(TP+FN != 0)
      R=TP/(TP+FN);
    else
      R=0;
    endif
    if(P+R != 0)
    F1=(2*P*R)/(P+R);
    else
      F1=0;
    endif
    










    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
