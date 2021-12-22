function [key] = apikey()
%% [apikey] = apikey()
% You find the api key here: https://developer.tibber.com/settings/accesstoken
% Fill in the key and run the git command in the dos promt:
%       git update-index --assume-unchanged apikey.m
%  to avoid commiting the file
   key='';
   if isempty(key)
       error('you need to put in the apikey')
   end
end

