function [key] = apikey()
%% [apikey] = apikey()
% You find the api key here: https://developer.tibber.com/settings/accesstoken
   key='0A';
   if isempty(key)
       error('you need to put in the apikey')
   end
end

