-module(name_server1).
%% API
-export([init/0, add/2, find/1, handle/2]).
-import(server3, [rpc/2]).

%%%-------------------------------------------------------------------
%%% @author Shuieryin
%%% @copyright (C) 2015, Shuieryin
%%% @doc
%%%
%%% @end
%%% Created : 04. Aug 2015 4:22 PM
%%%-------------------------------------------------------------------
-author("Shuieryin").

%% client routines
add(Name, Place) ->
    rpc(name_server, {add, Name, Place}).

find(Name) ->
    rpc(name_server, {find, Name}).

%% callback routines
init() ->
    dict:new().

handle({add, Name, Place}, Dict) ->
    {ok, dict:store(Name, Place, Dict)};
handle({find, Name}, Dict) ->
    {dict:find(Name, Dict), Dict}.