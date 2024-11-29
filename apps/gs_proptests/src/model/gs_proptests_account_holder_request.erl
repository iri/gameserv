-module(gs_proptests_account_holder_request).

-include("gs_proptests.hrl").

-export([gs_proptests_account_holder_request/0]).

-export([gs_proptests_account_holder_request/1]).

-export_type([gs_proptests_account_holder_request/0]).

-type gs_proptests_account_holder_request() ::
  [ {'first_name', binary() }
  | {'last_name', binary() }
  ].


gs_proptests_account_holder_request() ->
    gs_proptests_account_holder_request([]).

gs_proptests_account_holder_request(Fields) ->
  Default = [ {'first_name', binary() }
            , {'last_name', binary() }
            ],
  lists:ukeymerge(1, lists:sort(Fields), lists:sort(Default)).

