-module(gs_proptests_failure_response).

-include("gs_proptests.hrl").

-export([gs_proptests_failure_response/0]).

-export([gs_proptests_failure_response/1]).

-export_type([gs_proptests_failure_response/0]).

-type gs_proptests_failure_response() ::
  [ {'error_messages', list(binary()) }
  ].


gs_proptests_failure_response() ->
    gs_proptests_failure_response([]).

gs_proptests_failure_response(Fields) ->
  Default = [ {'error_messages', list(binary()) }
            ],
  lists:ukeymerge(1, lists:sort(Fields), lists:sort(Default)).

