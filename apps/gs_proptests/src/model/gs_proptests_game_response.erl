-module(gs_proptests_game_response).

-include("gs_proptests.hrl").

-export([gs_proptests_game_response/0]).

-export([gs_proptests_game_response/1]).

-export_type([gs_proptests_game_response/0]).

-type gs_proptests_game_response() ::
  [ {'id', binary() }
  | {'player_id', binary() }
  ].


gs_proptests_game_response() ->
    gs_proptests_game_response([]).

gs_proptests_game_response(Fields) ->
  Default = [ {'id', binary() }
            , {'player_id', binary() }
            ],
  lists:ukeymerge(1, lists:sort(Fields), lists:sort(Default)).

