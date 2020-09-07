function disp(obj)
% Display a file_array object
%__________________________________________________________________________
% Copyright (C) 2005-2017 Wellcome Trust Centre for Neuroimaging

%
% $Id: disp.m 7147 2017-08-03 14:07:01Z spm $


if numel(struct(obj))>1
    fprintf('       %s object: ', class(obj));
    sz = size(obj);
    if length(sz)>4
        fprintf('%d-D\n',length(sz));
    else
        for i=1:(length(sz)-1)
            fprintf('%d-by-',sz(i));
        end
        fprintf('%d\n',sz(end));
    end
else
    disp(mystruct(obj))
end


%==========================================================================
% function t = mystruct(obj)
%==========================================================================
function t = mystruct(obj)
fn = fieldnames(obj);
for i=1:length(fn)
    t.(fn{i}) = subsref(obj,struct('type','.','subs',fn{i}));
end
