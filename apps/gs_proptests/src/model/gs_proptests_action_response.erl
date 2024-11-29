-module(gs_proptests_action_response).

-include("gs_proptests.hrl").

-export([gs_proptests_action_response/0]).

-export([gs_proptests_action_response/1]).

-export_type([gs_proptests_action_response/0]).

-type gs_proptests_action_response() ::
  [ {'id', binary() }
  | {'status', gs_proptests_action_status:gs_proptests_action_status() }
  ].


gs_proptests_action_response() ->
    gs_proptests_action_response([]).

gs_proptests_action_response(Fields) ->
  Default = [ {'id', binary() }
            , {'status', gs_proptests_action_status:gs_proptests_action_status() }
            ],
  lists:ukeymerge(1, lists:sort(Fields), lists:sort(Default)).

