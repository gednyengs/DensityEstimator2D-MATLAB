% Inputs:
%   densityDomain     - cell array of 2 vectors each containing the min and 
%                       max values for the dimension they represent.
%   wavelet           - Name of wavelet to use for density approximation.
%                       Use matlab naming convention for wavelets.
%   startLevel        - Starting level for the the father wavelet
%                       (i.e. scaling function). 
%   stopLevel         - Last level for mother wavelet scaling. The start
%                       level is same as the father wavelet's.
%   waveletFlag       - If this flag is on then density estimation is done     
%                       with scaling + wavelets. The default is density
%                       estimation with the scaling function only. 
%                       waveletFlag = 1; Wavelet is on. 
%                       waveletFlag = 0; Wavelet is off. 
% Outputs:
%   scalTranslates    - cell array of vectors representing the translates
%                       for the dimension they represent.
%   waveTranslates    - Cell array of two other cell arrays which contain
%                       the translates for the wavelet functions in the two
%                       dimensions.
function [ scalTranslates, waveTranslates ] = getTranslates( densityDomain,...
                                                            wavelet,...
                                                            startLevel,...
                                                            stopLevel,...
                                                            waveletFlag)
    

% Find translation range dependent on the domain of the density and the
% wavelet basis.
transRange = translationRange2D(densityDomain, wavelet, startLevel);
scalTranslates = cell(2, 1);
rangeX = transRange{1};
rangeY = transRange{2};
scalTranslates{1} = rangeX(1) : rangeX(2);
scalTranslates{2} = rangeY(1) : rangeY(2);

if(waveletFlag == 1) % wavelet is on
   numWavelets = (stopLevel - startLevel) + 1;
   waveTranslates = cell(2, 1);
   waveTranslatesX = cell(numWavelets, 2);
   waveTranslatesY = cell(numWavelets, 2);
   
   for i = startLevel : stopLevel
       waveTransRange = translationRange2D(densityDomain,wavelet,i);
       waveTransRangeX = waveTransRange{1};
       waveTransRangeY = waveTransRange{2};
       waveTranslatesX{((i - startLevel) + 1),1} = waveTransRangeX(1) : waveTransRangeX(2);
       waveTranslatesY{((i - startLevel) + 1),1} = waveTransRangeY(1) : waveTransRangeY(2);
       waveTranslatesX{((i - startLevel) + 1),2} = i;
       waveTranslatesY{((i - startLevel) + 1),2} = i;
   end % i = startLevel : stopLevel
   
   waveTranslates{1} = waveTranslatesX;
   waveTranslates{2} = waveTranslatesY;
end % (waveletFlag == 1) % wavelet is on.

end % end function.

