-module(gs_proptests_action_update_request).

-include("gs_proptests.hrl").

-export([gs_proptests_action_update_request/0]).

-export([gs_proptests_action_update_request/1]).

-export_type([gs_proptests_action_update_request/0]).

-type gs_proptests_action_update_request() ::
  [ {'status', gs_proptests_action_status:gs_proptests_action_status() }
  ].


gs_proptests_action_update_request() ->
    gs_proptests_action_update_request([]).

gs_proptests_action_update_request(Fields) ->
  Default = [ {'status', gs_proptests_action_status:gs_proptests_action_status() }
            ],
  lists:ukeymerge(1, lists:sort(Fields), lists:sort(Default)).

