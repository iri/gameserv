-module(gs_proptests_action_status).

-include("gs_proptests.hrl").

-export([gs_proptests_action_status/0]).

-export_type([gs_proptests_action_status/0]).

-type gs_proptests_action_status() ::
  binary().

gs_proptests_action_status() ->
  elements([<<"CREATED">>, <<"SETTLED">>, <<"CANCELED">>]).

