-module(gs_proptests_transfer_status).

-include("gs_proptests.hrl").

-export([gs_proptests_transfer_status/0]).

-export_type([gs_proptests_transfer_status/0]).

-type gs_proptests_transfer_status() ::
  binary().

gs_proptests_transfer_status() ->
  elements([<<"CREATED">>, <<"SETTLED">>, <<"CANCELED">>]).

