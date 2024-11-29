-module(prop_gs_proptests).

-export([prop_test/0]).

prop_test() ->
  {ok, _} = application:ensure_all_started(gs_proptests),
  gs_proptests_statem:prop_main().
