clc,clear,close all
s = [-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
t = [1 1 1 0 0];
disp('Signal:'), disp([1:size(s, 2);s]);
disp('Template:'), disp([1:size(t,2);t]);

index = find_template(t, s);
disp('Index:'), disp(index);

function index = find_template(t, s)
len_s = size(s,2);
len_t = size(t,2);

% Keep tacking the max_cor and corresponding index !
max_cor_ind = 1;
max_cor = 0;
t_normalized = zero_normalized(t);
for i = 1:(len_s - len_t + 1)
    %cor = s(i:i+len_t-1) * t'
    s_patch = s(i:i+len_t-1);
    s_patch_normalized = zero_normalized(s_patch);
    cor = t_normalized * s_patch_normalized';
    %cor = norm(s(i:i+len_t-1)- t);
    if cor > max_cor
        max_cor = cor;
        max_cor_ind = i;
    end
end

index = max_cor_ind;
end

function x_normalized = zero_normalized(x)
% Test Case
%x = [1 1 0]
x = double(x);
x = x(:)'; % convert to row vector
x_mean = sum(x) / size(x,2);
variance = 1/size(x,2) * (x - ones(size(x)) * x_mean)*(x - ones(size(x)) * x_mean)';
x_normalized = (x - x_mean) / sqrt(variance); 
end
