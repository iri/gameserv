-module(gs_proptests_game_type).

-include("gs_proptests.hrl").

-export([gs_proptests_game_type/0]).

-export_type([gs_proptests_game_type/0]).

-type gs_proptests_game_type() ::
  binary().

gs_proptests_game_type() ->
  elements([<<"go">>, <<"chess">>]).

