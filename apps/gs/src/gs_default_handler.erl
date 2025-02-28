-module(gs_default_handler).
-moduledoc """
Exposes the following operation IDs:

- `POST` to `/actions`, OperationId: `createAction`:
Create a Action.


- `POST` to `/games`, OperationId: `createGame`:
Create an Game.


- `POST` to `/players`, OperationId: `createPlayer`:
Create an Game Holder.


- `GET` to `/actions/:id`, OperationId: `getAction`:
Get a Action.


- `GET` to `/games/:id`, OperationId: `getGame`:
Get an Game.


- `GET` to `/players:id`, OperationId: `getPlayer`:
Get an Game Holder.


- `GET` to `/healtcheck`, OperationId: `healthcheck`:
Healthcheck.


- `GET` to `/ping`, OperationId: `ping`:
Ping.


- `PATCH` to `/actions/:id`, OperationId: `updateAction`:
Update a Action&#39;s status.


""".

-behaviour(cowboy_rest).

-include_lib("kernel/include/logger.hrl").

%% Cowboy REST callbacks
-export([init/2]).
-export([allowed_methods/2]).
-export([content_types_accepted/2]).
-export([content_types_provided/2]).
-export([delete_resource/2]).
-export([is_authorized/2]).
-export([valid_content_headers/2]).
-export([handle_type_accepted/2, handle_type_provided/2]).

-ignore_xref([handle_type_accepted/2, handle_type_provided/2]).

-export_type([class/0, operation_id/0]).

-type class() :: 'default'.

-type operation_id() ::
    'createAction' %% Create a Action
    | 'createGame' %% Create an Game
    | 'createPlayer' %% Create an Game Holder
    | 'getAction' %% Get a Action
    | 'getGame' %% Get an Game
    | 'getPlayer' %% Get an Game Holder
    | 'healthcheck' %% Healthcheck
    | 'ping' %% Ping
    | 'updateAction'. %% Update a Action&#39;s status


-record(state,
        {operation_id :: operation_id(),
         accept_callback :: gs_logic_handler:accept_callback(),
         provide_callback :: gs_logic_handler:provide_callback(),
         api_key_handler :: gs_logic_handler:api_key_callback(),
         context = #{} :: gs_logic_handler:context()}).

-type state() :: #state{}.

-spec init(cowboy_req:req(), gs_router:init_opts()) ->
    {cowboy_rest, cowboy_req:req(), state()}.
init(Req, {Operations, Module}) ->
    Method = cowboy_req:method(Req),
    OperationID = maps:get(Method, Operations, undefined),
    ?LOG_INFO(#{what => "Attempt to process operation",
                method => Method,
                operation_id => OperationID}),
    State = #state{operation_id = OperationID,
                   accept_callback = fun Module:accept_callback/4,
                   provide_callback = fun Module:provide_callback/4,
                   api_key_handler = fun Module:authorize_api_key/2},
    {cowboy_rest, Req, State}.

-spec allowed_methods(cowboy_req:req(), state()) ->
    {[binary()], cowboy_req:req(), state()}.
allowed_methods(Req, #state{operation_id = 'createAction'} = State) ->
    {[<<"POST">>], Req, State};
allowed_methods(Req, #state{operation_id = 'createGame'} = State) ->
    {[<<"POST">>], Req, State};
allowed_methods(Req, #state{operation_id = 'createPlayer'} = State) ->
    {[<<"POST">>], Req, State};
allowed_methods(Req, #state{operation_id = 'getAction'} = State) ->
    {[<<"GET">>], Req, State};
allowed_methods(Req, #state{operation_id = 'getGame'} = State) ->
    {[<<"GET">>], Req, State};
allowed_methods(Req, #state{operation_id = 'getPlayer'} = State) ->
    {[<<"GET">>], Req, State};
allowed_methods(Req, #state{operation_id = 'healthcheck'} = State) ->
    {[<<"GET">>], Req, State};
allowed_methods(Req, #state{operation_id = 'ping'} = State) ->
    {[<<"GET">>], Req, State};
allowed_methods(Req, #state{operation_id = 'updateAction'} = State) ->
    {[<<"PATCH">>], Req, State};
allowed_methods(Req, State) ->
    {[], Req, State}.

-spec is_authorized(cowboy_req:req(), state()) ->
    {true | {false, iodata()}, cowboy_req:req(), state()}.
is_authorized(Req, State) ->
    {true, Req, State}.

-spec content_types_accepted(cowboy_req:req(), state()) ->
    {[{binary(), atom()}], cowboy_req:req(), state()}.
content_types_accepted(Req, #state{operation_id = 'createAction'} = State) ->
    {[
      {<<"application/json">>, handle_type_accepted}
     ], Req, State};
content_types_accepted(Req, #state{operation_id = 'createGame'} = State) ->
    {[
      {<<"application/json">>, handle_type_accepted}
     ], Req, State};
content_types_accepted(Req, #state{operation_id = 'createPlayer'} = State) ->
    {[
      {<<"application/json">>, handle_type_accepted}
     ], Req, State};
content_types_accepted(Req, #state{operation_id = 'getAction'} = State) ->
    {[], Req, State};
content_types_accepted(Req, #state{operation_id = 'getGame'} = State) ->
    {[], Req, State};
content_types_accepted(Req, #state{operation_id = 'getPlayer'} = State) ->
    {[], Req, State};
content_types_accepted(Req, #state{operation_id = 'healthcheck'} = State) ->
    {[], Req, State};
content_types_accepted(Req, #state{operation_id = 'ping'} = State) ->
    {[], Req, State};
content_types_accepted(Req, #state{operation_id = 'updateAction'} = State) ->
    {[
      {<<"application/json">>, handle_type_accepted}
     ], Req, State};
content_types_accepted(Req, State) ->
    {[], Req, State}.

-spec valid_content_headers(cowboy_req:req(), state()) ->
    {boolean(), cowboy_req:req(), state()}.
valid_content_headers(Req, #state{operation_id = 'createAction'} = State) ->
    {true, Req, State};
valid_content_headers(Req, #state{operation_id = 'createGame'} = State) ->
    {true, Req, State};
valid_content_headers(Req, #state{operation_id = 'createPlayer'} = State) ->
    {true, Req, State};
valid_content_headers(Req, #state{operation_id = 'getAction'} = State) ->
    {true, Req, State};
valid_content_headers(Req, #state{operation_id = 'getGame'} = State) ->
    {true, Req, State};
valid_content_headers(Req, #state{operation_id = 'getPlayer'} = State) ->
    {true, Req, State};
valid_content_headers(Req, #state{operation_id = 'healthcheck'} = State) ->
    {true, Req, State};
valid_content_headers(Req, #state{operation_id = 'ping'} = State) ->
    {true, Req, State};
valid_content_headers(Req, #state{operation_id = 'updateAction'} = State) ->
    {true, Req, State};
valid_content_headers(Req, State) ->
    {false, Req, State}.

-spec content_types_provided(cowboy_req:req(), state()) ->
    {[{binary(), atom()}], cowboy_req:req(), state()}.
content_types_provided(Req, #state{operation_id = 'createAction'} = State) ->
    {[
      {<<"application/json">>, handle_type_provided}
     ], Req, State};
content_types_provided(Req, #state{operation_id = 'createGame'} = State) ->
    {[
      {<<"application/json">>, handle_type_provided}
     ], Req, State};
content_types_provided(Req, #state{operation_id = 'createPlayer'} = State) ->
    {[
      {<<"application/json">>, handle_type_provided}
     ], Req, State};
content_types_provided(Req, #state{operation_id = 'getAction'} = State) ->
    {[
      {<<"application/json">>, handle_type_provided}
     ], Req, State};
content_types_provided(Req, #state{operation_id = 'getGame'} = State) ->
    {[
      {<<"application/json">>, handle_type_provided}
     ], Req, State};
content_types_provided(Req, #state{operation_id = 'getPlayer'} = State) ->
    {[
      {<<"application/json">>, handle_type_provided}
     ], Req, State};
content_types_provided(Req, #state{operation_id = 'healthcheck'} = State) ->
    {[
      {<<"application/json">>, handle_type_provided}
     ], Req, State};
content_types_provided(Req, #state{operation_id = 'ping'} = State) ->
    {[], Req, State};
content_types_provided(Req, #state{operation_id = 'updateAction'} = State) ->
    {[
      {<<"application/json">>, handle_type_provided}
     ], Req, State};
content_types_provided(Req, State) ->
    {[], Req, State}.

-spec delete_resource(cowboy_req:req(), state()) ->
    {boolean(), cowboy_req:req(), state()}.
delete_resource(Req, State) ->
    {Res, Req1, State1} = handle_type_accepted(Req, State),
    {true =:= Res, Req1, State1}.

-spec handle_type_accepted(cowboy_req:req(), state()) ->
    { gs_logic_handler:accept_callback_return(), cowboy_req:req(), state()}.
handle_type_accepted(Req, #state{operation_id = OperationID,
                                 accept_callback = Handler,
                                 context = Context} = State) ->
    {Res, Req1, Context1} = Handler(default, OperationID, Req, Context),
    {Res, Req1, State#state{context = Context1}}.

-spec handle_type_provided(cowboy_req:req(), state()) ->
    { gs_logic_handler:provide_callback_return(), cowboy_req:req(), state()}.
handle_type_provided(Req, #state{operation_id = OperationID,
                                 provide_callback = Handler,
                                 context = Context} = State) ->
    {Res, Req1, Context1} = Handler(default, OperationID, Req, Context),
    {Res, Req1, State#state{context = Context1}}.
