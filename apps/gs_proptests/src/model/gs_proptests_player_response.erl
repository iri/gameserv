-module(gs_proptests_player_response).

-include("gs_proptests.hrl").

-export([gs_proptests_player_response/0]).

-export([gs_proptests_player_response/1]).

-export_type([gs_proptests_player_response/0]).

-type gs_proptests_player_response() ::
  [ {'id', binary() }
  | {'first_name', binary() }
  | {'last_name', binary() }
  ].


gs_proptests_player_response() ->
    gs_proptests_player_response([]).

gs_proptests_player_response(Fields) ->
  Default = [ {'id', binary() }
            , {'first_name', binary() }
            , {'last_name', binary() }
            ],
  lists:ukeymerge(1, lists:sort(Fields), lists:sort(Default)).

