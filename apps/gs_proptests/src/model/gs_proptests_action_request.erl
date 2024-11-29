-module(gs_proptests_action_request).

-include("gs_proptests.hrl").

-export([gs_proptests_action_request/0]).

-export([gs_proptests_action_request/1]).

-export_type([gs_proptests_action_request/0]).

-type gs_proptests_action_request() ::
  [ {'game_id', binary() }
  ].


gs_proptests_action_request() ->
    gs_proptests_action_request([]).

gs_proptests_action_request(Fields) ->
  Default = [ {'game_id', binary() }
            ],
  lists:ukeymerge(1, lists:sort(Fields), lists:sort(Default)).

