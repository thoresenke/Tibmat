classdef clTibber
    %% clTibber
    % Matlab inteface for Tibber api  
    % copyright (C) 2021  Karl Erik Thoresen
    %
    % docmentation : https://developer.tibber.com/
    % You find the api key here: https://developer.tibber.com/settings/accesstoken
    %
    properties
        url = "https://api.tibber.com/v1-beta/gql" % Base URL
        apiKey =  '' ;
        % You find the api key here: https://developer.tibber.com/settings/accesstoken

        opts
    end
    
    methods
        function o = clTibber(key)
            %%  o = clTibber(key)
            %

            o.apiKey=key;
            o.opts = weboptions('HeaderFields', {'Authorization' o.apiKey});
            o.opts.Timeout = 10;

        end
        
     
        function [Ep,tm]=getConsumptions(o,hours)
        %%  [Ep,tm]=getConsumptions(o,hours)
            body.query = "{ viewer { homes {     consumption(resolution: HOURLY, last:"+hours +") {  nodes {              consumption   from          }      }    }  }}";
            res = webwrite(o.url,body,o.opts);
 

         %% 

          %% interpret the result
            nods=res.data.viewer.homes(2).consumption.nodes;
            for i = length(nods):-1:1
                val=nods(i).consumption;
                 tm(i) =datetime( nods(i).from,'Format','yyyy-MM-dd''T''HH:mm:ss.SSSZ','Timezone' ,'Europe/Zurich') ;
                if isempty(val),  Ep(i)=-1;
                else,             Ep(i) = nods(i).consumption;
                end
            end


        end

    end
       
end

