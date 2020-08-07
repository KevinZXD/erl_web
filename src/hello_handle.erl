%%%-------------------------------------------------------------------
%%% @author xudong12
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 8月 2020 9:59 上午
%%%-------------------------------------------------------------------
-module(hello_handle).
-author("xudong12").

%% API
-export([init/2]).
init(Req0, State) ->
  Req = cowboy_req:reply(200,
    #{<<"content-type">> => <<"text/plain; charset=utf-8">>},
    <<"Hello Erlang!">>,
    Req0),

  {ok, Req, State}.
