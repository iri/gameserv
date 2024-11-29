-module(gs_proptests_new_game).

-include("gs_proptests.hrl").

-export([gs_proptests_new_game/0]).

-export([gs_proptests_new_game/1]).

-export_type([gs_proptests_new_game/0]).

-type gs_proptests_new_game() ::
  [ {'type', gs_proptests_game_type:gs_proptests_game_type() }
  ].


gs_proptests_new_game() ->
    gs_proptests_new_game([]).

gs_proptests_new_game(Fields) ->
  Default = [ {'type', gs_proptests_game_type:gs_proptests_game_type() }
            ],
  lists:ukeymerge(1, lists:sort(Fields), lists:sort(Default)).

