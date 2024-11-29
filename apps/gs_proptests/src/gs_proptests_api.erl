-module(gs_proptests_api).

-export([ create_action/1
        , create_game/1
        , create_player/1
        , get_action/1
        , get_game/1
        , get_player/1
        , healthcheck/0
        , ping/0
        , update_action/2
        ]).

-define(BASE_URL, "/v1").

%% @doc Create a Action
%% 
-spec create_action(gs_proptests_action_request:gs_proptests_action_request()) ->
  gs_proptests_utils:response().
create_action(GsProptestsActionRequest) ->
  Method      = post,
  Host        = application:get_env(gs_proptests, host, "http://localhost:8080"),
  Path        = ["/actions"],
  Body        = GsProptestsActionRequest,
  ContentType = hd(["application/json"]),

  gs_proptests_utils:request(Method, [Host, ?BASE_URL, Path], jsx:encode(Body), ContentType).

%% @doc Create an Game
%% 
-spec create_game(gs_proptests_game_request:gs_proptests_game_request()) ->
  gs_proptests_utils:response().
create_game(GsProptestsGameRequest) ->
  Method      = post,
  Host        = application:get_env(gs_proptests, host, "http://localhost:8080"),
  Path        = ["/games"],
  Body        = GsProptestsGameRequest,
  ContentType = hd(["application/json"]),

  gs_proptests_utils:request(Method, [Host, ?BASE_URL, Path], jsx:encode(Body), ContentType).

%% @doc Create an Game Holder
%% 
-spec create_player(gs_proptests_player_request:gs_proptests_player_request()) ->
  gs_proptests_utils:response().
create_player(GsProptestsPlayerRequest) ->
  Method      = post,
  Host        = application:get_env(gs_proptests, host, "http://localhost:8080"),
  Path        = ["/players"],
  Body        = GsProptestsPlayerRequest,
  ContentType = hd(["application/json"]),

  gs_proptests_utils:request(Method, [Host, ?BASE_URL, Path], jsx:encode(Body), ContentType).

%% @doc Get a Action
%% 
-spec get_action(binary()) ->
  gs_proptests_utils:response().
get_action(Id) ->
  Method      = get,
  Host        = application:get_env(gs_proptests, host, "http://localhost:8080"),
  Path        = ["/actions/", Id, ""],

  gs_proptests_utils:request(Method, [Host, ?BASE_URL, Path]).

%% @doc Get an Game
%% 
-spec get_game(binary()) ->
  gs_proptests_utils:response().
get_game(Id) ->
  Method      = get,
  Host        = application:get_env(gs_proptests, host, "http://localhost:8080"),
  Path        = ["/games/", Id, ""],

  gs_proptests_utils:request(Method, [Host, ?BASE_URL, Path]).

%% @doc Get an Game Holder
%% 
-spec get_player(binary()) ->
  gs_proptests_utils:response().
get_player(Id) ->
  Method      = get,
  Host        = application:get_env(gs_proptests, host, "http://localhost:8080"),
  Path        = ["/players", Id, ""],

  gs_proptests_utils:request(Method, [Host, ?BASE_URL, Path]).

%% @doc Healthcheck
%% 
-spec healthcheck() ->
  gs_proptests_utils:response().
healthcheck() ->
  Method      = get,
  Host        = application:get_env(gs_proptests, host, "http://localhost:8080"),
  Path        = ["/healtcheck"],

  gs_proptests_utils:request(Method, [Host, ?BASE_URL, Path]).

%% @doc Ping
%% 
-spec ping() ->
  gs_proptests_utils:response().
ping() ->
  Method      = get,
  Host        = application:get_env(gs_proptests, host, "http://localhost:8080"),
  Path        = ["/ping"],

  gs_proptests_utils:request(Method, [Host, ?BASE_URL, Path]).

%% @doc Update a Action's status
%% 
-spec update_action(binary(), gs_proptests_action_update_request:gs_proptests_action_update_request()) ->
  gs_proptests_utils:response().
update_action(Id, GsProptestsActionUpdateRequest) ->
  Method      = patch,
  Host        = application:get_env(gs_proptests, host, "http://localhost:8080"),
  Path        = ["/actions/", Id, ""],
  Body        = GsProptestsActionUpdateRequest,
  ContentType = hd(["application/json"]),

  gs_proptests_utils:request(Method, [Host, ?BASE_URL, Path], jsx:encode(Body), ContentType).

