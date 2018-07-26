-module(env).
-compile(export_all).
-include("types.hrl").

%% Zoe Millard && Ayse Akin
%% 11/4/17, HW3
%% "I pledge my honor that I have abided by the Stevens Honor System"-zm, aa

-spec new()-> envType().
new() ->
    dict:new().
    % 100 complete

-spec add(envType(),atom(),valType())-> envType().
add(Env,Key,Value) ->
	dict:store(Key, Value, Env).
    % complete

-spec lookup(envType(),atom())-> valType().
lookup(Env,Key) -> 
	dict:find(Key,Env).
   % complete


