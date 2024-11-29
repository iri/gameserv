-module(gs_proptests_user).

-include("gs_proptests.hrl").

-export([gs_proptests_user/0]).

-export([gs_proptests_user/1]).

-export_type([gs_proptests_user/0]).

-type gs_proptests_user() ::
  [ {'id', gs_proptests_u_uid:gs_proptests_u_uid() }
  | {'name', binary() }
  | {'email', binary() }
  | {'status', binary() }
  ].


gs_proptests_user() ->
    gs_proptests_user([]).

gs_proptests_user(Fields) ->
  Default = [ {'id', binary() }
            , {'name', binary() }
            , {'email', binary() }
            , {'status', elements([<<"active">>, <<"archived">>]) }
            ],
  lists:ukeymerge(1, lists:sort(Fields), lists:sort(Default)).

