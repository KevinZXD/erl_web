%%%-------------------------------------------------------------------
%% @doc erl_web public API
%% @end
%%%-------------------------------------------------------------------

-module(erl_web_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
  start_http_server(),
  erl_web_sup:start_link().
start_http_server() ->
  Dispatch = cowboy_router:compile([
    {'_', [{"/", hello_handle, [http]}]}
  ]),
  {ok, _} = cowboy:start_clear(http_listener,
    [{port, 8080}],
    #{env => #{dispatch => Dispatch}}
  ),
  ok.

stop(_State) ->
  ok.

%% internal functions
