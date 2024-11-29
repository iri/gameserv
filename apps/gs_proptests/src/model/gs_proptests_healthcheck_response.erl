-module(gs_proptests_healthcheck_response).

-include("gs_proptests.hrl").

-export([gs_proptests_healthcheck_response/0]).

-export([gs_proptests_healthcheck_response/1]).

-export_type([gs_proptests_healthcheck_response/0]).

-type gs_proptests_healthcheck_response() ::
  [ {'healthy', list(binary()) }
  | {'unhealthy', list(binary()) }
  ].


gs_proptests_healthcheck_response() ->
    gs_proptests_healthcheck_response([]).

gs_proptests_healthcheck_response(Fields) ->
  Default = [ {'healthy', list(binary()) }
            , {'unhealthy', list(binary()) }
            ],
  lists:ukeymerge(1, lists:sort(Fields), lists:sort(Default)).

