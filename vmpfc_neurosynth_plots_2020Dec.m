%% vmPFC related term-based Neurosynth metas 
% script to reproduce meta-analytics maps of Figure 3 (Koban, Gianaros, Kober, & Wager, 2021)
% by Leonie Koban, 06/01/2021
% 
% Instructions:
% save this script in the same folder as the Neurosynth maps, run the
% script from this folder; Canlab toolbox needs to be installed
% (https://github.com/canlab)
% =========================================================================

terms = {'self'; 'thoughts'; 'decision making'; 'autonomic'};

cols = {[95 173 228]./256;... % define colors
        [139 193 69]./256;...
        [90 224 187]./256;...
        [233 137 96]./256};

for t = 1:numel(terms) % plot figure for each image, saggital views at x = -6
    
    dat{t} = fmri_data(filenames([terms{t}, '*.nii']));
    dat{t} = threshold(dat{t}, [0 Inf], 'raw-between'); % positive associations only

    figure;
    o2 = fmridisplay;
    axh{t} = axes('Position', [0.1 0.3 .5 .5]);
    o2 = montage(o2, 'saggital', 'wh_slice', [-6 0 0], 'existing_axes', axh{t});
    o2 = addblobs(o2, region(dat{t}), 'color', cols{t}, 'contour'); title(terms{t})

end
