-module(gs_proptests_new_user).

-include("gs_proptests.hrl").

-export([gs_proptests_new_user/0]).

-export([gs_proptests_new_user/1]).

-export_type([gs_proptests_new_user/0]).

-type gs_proptests_new_user() ::
  [ {'name', binary() }
  | {'email', binary() }
  ].


gs_proptests_new_user() ->
    gs_proptests_new_user([]).

gs_proptests_new_user(Fields) ->
  Default = [ {'name', binary() }
            , {'email', binary() }
            ],
  lists:ukeymerge(1, lists:sort(Fields), lists:sort(Default)).

