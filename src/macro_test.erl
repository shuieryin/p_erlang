%% API
-module(macro_test).
-export([loop/1]).

%%%-------------------------------------------------------------------
%%% @author Li
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. Apr 2015 10:41 AM
%%%-------------------------------------------------------------------
-author("Li").

-ifdef(debug_flag).
-define(DEBUG(X), io:format("DEBUG ~p:~p ~p~n", [?MODULE, ?LINE, X])).
-else.
-define(DEBUG(X), void).
-endif.

%% c(macro_test, {d, debug_flag}).
%% macro_test:loop(4).

loop(0) ->
	done;
loop(N) ->
	?DEBUG(N),
	loop(N - 1).