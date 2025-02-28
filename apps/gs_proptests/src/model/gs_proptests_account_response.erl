-module(gs_proptests_account_response).

-include("gs_proptests.hrl").

-export([gs_proptests_account_response/0]).

-export([gs_proptests_account_response/1]).

-export_type([gs_proptests_account_response/0]).

-type gs_proptests_account_response() ::
  [ {'id', binary() }
  | {'account_holder_id', binary() }
  | {'balance', integer() }
  ].


gs_proptests_account_response() ->
    gs_proptests_account_response([]).

gs_proptests_account_response(Fields) ->
  Default = [ {'id', binary() }
            , {'account_holder_id', binary() }
            , {'balance', integer() }
            ],
  lists:ukeymerge(1, lists:sort(Fields), lists:sort(Default)).

