%%%-------------------------------------------------------------------
%% @doc gameserv public API
%% @end
%%%-------------------------------------------------------------------

-module(gameserv_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    Opts = #{transport_opts => [{ip,{127,0,0,1}},{port,8080}]},
    gs_server:start(gs, Opts),
    gameserv_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
