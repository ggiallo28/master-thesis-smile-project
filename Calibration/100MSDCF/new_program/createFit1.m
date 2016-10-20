function [fitresult, gof] = createFit1(idx, idy)
%CREATEFIT2(IDX,IDY)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : idx
%      Y Output: idy
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 21-Oct-2016 01:16:55


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( idx, idy );

% Set up fittype and options.
ft = fittype( 'poly6' );
opts = fitoptions( 'Method', 'LinearLeastSquares' );
opts.Normalize = 'on';
opts.Robust = 'Bisquare';

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
% figure( 'Name', 'untitled fit 1' );
% h = plot( fitresult, xData, yData );
% legend( h, 'idy vs. idx', 'untitled fit 1', 'Location', 'NorthEast' );
% % Label axes
% xlabel idx
% ylabel idy
% grid on


