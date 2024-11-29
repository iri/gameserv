-module(gs_proptests_game).

-include("gs_proptests.hrl").

-export([gs_proptests_game/0]).

-export([gs_proptests_game/1]).

-export_type([gs_proptests_game/0]).

-type gs_proptests_game() ::
  [ {'id', gs_proptests_u_uid:gs_proptests_u_uid() }
  | {'type', gs_proptests_game_type:gs_proptests_game_type() }
  | {'status', binary() }
  | {'startTime', datetime() }
  | {'endTime', datetime() }
  ].


gs_proptests_game() ->
    gs_proptests_game([]).

gs_proptests_game(Fields) ->
  Default = [ {'id', binary() }
            , {'type', gs_proptests_game_type:gs_proptests_game_type() }
            , {'status', elements([<<"not started">>, <<"in progress">>, <<"finished">>]) }
            , {'startTime', datetime() }
            , {'endTime', datetime() }
            ],
  lists:ukeymerge(1, lists:sort(Fields), lists:sort(Default)).

