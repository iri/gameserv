-module(gs_proptests_statem).

-behaviour(proper_statem).

-include("gs_proptests.hrl").
-include_lib("proper/include/proper_common.hrl").
-include_lib("stdlib/include/assert.hrl").

-compile(export_all).
-compile(nowarn_export_all).

-include("gs_proptests_statem.hrl").

%%==============================================================================
%% The statem's property
%%==============================================================================

prop_main() ->
  setup(),
  ?FORALL( Cmds
         , proper_statem:commands(?MODULE)
         , begin
             cleanup(),
             { History
             , State
             , Result
             } = proper_statem:run_commands(?MODULE, Cmds),
             ?WHENFAIL(
                io:format("History: ~p\nState: ~p\nResult: ~p\nCmds: ~p\n",
                          [ History
                          , State
                          , Result
                          , proper_statem:command_names(Cmds)
                          ]),
                proper:aggregate( proper_statem:command_names(Cmds)
                                , Result =:= ok
                                )
               )
           end
         ).

%%==============================================================================
%% Setup
%%==============================================================================

setup() -> ok.

%%==============================================================================
%% Cleanup
%%==============================================================================

cleanup() -> ok.

%%==============================================================================
%% Initial State
%%==============================================================================

initial_state() -> #{}.

%%==============================================================================
%% create_action
%%==============================================================================

create_action(GsProptestsActionRequest) ->
  gs_proptests_api:create_action(GsProptestsActionRequest).

create_action_args(_S) ->
  [gs_proptests_action_request:gs_proptests_action_request()].

%%==============================================================================
%% create_game
%%==============================================================================

create_game(GsProptestsGameRequest) ->
  gs_proptests_api:create_game(GsProptestsGameRequest).

create_game_args(_S) ->
  [gs_proptests_game_request:gs_proptests_game_request()].

%%==============================================================================
%% create_player
%%==============================================================================

create_player(GsProptestsPlayerRequest) ->
  gs_proptests_api:create_player(GsProptestsPlayerRequest).

create_player_args(_S) ->
  [gs_proptests_player_request:gs_proptests_player_request()].

%%==============================================================================
%% get_action
%%==============================================================================

get_action(Id) ->
  gs_proptests_api:get_action(Id).

get_action_args(_S) ->
  [binary()].

%%==============================================================================
%% get_game
%%==============================================================================

get_game(Id) ->
  gs_proptests_api:get_game(Id).

get_game_args(_S) ->
  [binary()].

%%==============================================================================
%% get_player
%%==============================================================================

get_player(Id) ->
  gs_proptests_api:get_player(Id).

get_player_args(_S) ->
  [binary()].

%%==============================================================================
%% healthcheck
%%==============================================================================

healthcheck() ->
  gs_proptests_api:healthcheck().

healthcheck_args(_S) ->
  [].

%%==============================================================================
%% ping
%%==============================================================================

ping() ->
  gs_proptests_api:ping().

ping_args(_S) ->
  [].

%%==============================================================================
%% update_action
%%==============================================================================

update_action(Id, GsProptestsActionUpdateRequest) ->
  gs_proptests_api:update_action(Id, GsProptestsActionUpdateRequest).

update_action_args(_S) ->
  [binary(), gs_proptests_action_update_request:gs_proptests_action_update_request()].

