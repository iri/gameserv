-module(gs_proptests_transfer_request).

-include("gs_proptests.hrl").

-export([gs_proptests_transfer_request/0]).

-export([gs_proptests_transfer_request/1]).

-export_type([gs_proptests_transfer_request/0]).

-type gs_proptests_transfer_request() ::
  [ {'source_account_id', binary() }
  | {'destination_account_id', binary() }
  | {'amount', integer() }
  ].


gs_proptests_transfer_request() ->
    gs_proptests_transfer_request([]).

gs_proptests_transfer_request(Fields) ->
  Default = [ {'source_account_id', binary() }
            , {'destination_account_id', binary() }
            , {'amount', integer() }
            ],
  lists:ukeymerge(1, lists:sort(Fields), lists:sort(Default)).

