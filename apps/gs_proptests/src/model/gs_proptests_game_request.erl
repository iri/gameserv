-module(gs_proptests_game_request).

-include("gs_proptests.hrl").

-export([gs_proptests_game_request/0]).

-export([gs_proptests_game_request/1]).

-export_type([gs_proptests_game_request/0]).

-type gs_proptests_game_request() ::
  [ {'player_id', binary() }
  ].


gs_proptests_game_request() ->
    gs_proptests_game_request([]).

gs_proptests_game_request(Fields) ->
  Default = [ {'player_id', binary() }
            ],
  lists:ukeymerge(1, lists:sort(Fields), lists:sort(Default)).

