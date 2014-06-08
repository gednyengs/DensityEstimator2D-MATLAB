%--------------------------------------------------------------------------\
% Inputs:
%     densitySupport: cell array of two 2x1 vectors representing the density
%                     range in the two dimensions.
%     wName             - 3 to 4 charater code name of wavelet for density 
%                       approximation.
%     level             - integer value for the wavelet scale level.
%                       Scale is calculated as 2^level.

function transRange = translationRange2D(densitySupport, wName, level)
    transRange = cell(2,1);
    wSupport = waveSupport(wName);
    densitySupportDim1 = densitySupport{1};
    densitySupportDim2 = densitySupport{2};
    transRange{1} = [floor((2^level)*densitySupportDim1(1) - wSupport(2)),...
                     ceil((2^level)*densitySupportDim1(2) - wSupport(1))];
    transRange{2} = [floor((2^level)*densitySupportDim2(1) - wSupport(2)),...
                     ceil((2^level)*densitySupportDim2(2) - wSupport(1))];
end