-module(gs_proptests_player_request).

-include("gs_proptests.hrl").

-export([gs_proptests_player_request/0]).

-export([gs_proptests_player_request/1]).

-export_type([gs_proptests_player_request/0]).

-type gs_proptests_player_request() ::
  [ {'first_name', binary() }
  | {'last_name', binary() }
  ].


gs_proptests_player_request() ->
    gs_proptests_player_request([]).

gs_proptests_player_request(Fields) ->
  Default = [ {'first_name', binary() }
            , {'last_name', binary() }
            ],
  lists:ukeymerge(1, lists:sort(Fields), lists:sort(Default)).

