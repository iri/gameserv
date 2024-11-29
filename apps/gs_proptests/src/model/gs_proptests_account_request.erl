-module(gs_proptests_account_request).

-include("gs_proptests.hrl").

-export([gs_proptests_account_request/0]).

-export([gs_proptests_account_request/1]).

-export_type([gs_proptests_account_request/0]).

-type gs_proptests_account_request() ::
  [ {'account_holder_id', binary() }
  | {'balance', integer() }
  ].


gs_proptests_account_request() ->
    gs_proptests_account_request([]).

gs_proptests_account_request(Fields) ->
  Default = [ {'account_holder_id', binary() }
            , {'balance', integer() }
            ],
  lists:ukeymerge(1, lists:sort(Fields), lists:sort(Default)).

