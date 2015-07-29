-module(svg1).
%% API
-export([start/1]).

%%%-------------------------------------------------------------------
%%% @author Li
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. Jul 2015 9:39 PM
%%%-------------------------------------------------------------------
-author("Li").

start(Browser) ->
    Browser ! [{cmd, add_canvas}, {tag, svg}, {width, 180}, {height, 120}],
    running(Browser, 10, 10).

running(Browser, X, Y) ->
    receive
        {Browser, {struct, [{clicked, <<"draw rectangle">>}]}} ->
            Browser ! [
                {cmd, add_svg_thing},
                {type, rect},
                {rx, 3},
                {ry, 3},
                {x, X},
                {y, Y},
                {width, 100},
                {height, 50},
                {stroke, blue},
                {'stroke-width', 2},
                {fill, red}
            ],
            running(Browser, X + 10, Y + 10);
        Error ->
            io:format("Error:~p~n", [Error])
    end.