-module(gs_proptests_transfer_response).

-include("gs_proptests.hrl").

-export([gs_proptests_transfer_response/0]).

-export([gs_proptests_transfer_response/1]).

-export_type([gs_proptests_transfer_response/0]).

-type gs_proptests_transfer_response() ::
  [ {'id', binary() }
  | {'source_account_id', binary() }
  | {'destination_account_id', binary() }
  | {'amount', integer() }
  | {'status', gs_proptests_transfer_status:gs_proptests_transfer_status() }
  ].


gs_proptests_transfer_response() ->
    gs_proptests_transfer_response([]).

gs_proptests_transfer_response(Fields) ->
  Default = [ {'id', binary() }
            , {'source_account_id', binary() }
            , {'destination_account_id', binary() }
            , {'amount', integer() }
            , {'status', gs_proptests_transfer_status:gs_proptests_transfer_status() }
            ],
  lists:ukeymerge(1, lists:sort(Fields), lists:sort(Default)).

