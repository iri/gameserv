gameserv
========

REST server for board games

Build
-----

    $ rebar3 compile

Run
---

    $ rebar3 shell

Test (server must be running)
-----------------------------

    $ sh tools/upd-rules.sh
    $ cd apps/gs_proptests/
    $ rebar3 proper

Re-generate API from spec file
------------------------------

    $ openapi-generator-cli generate -g erlang-server -i tools/gameserver.yaml -o apps/gs --additional-properties packageName=gs
    $ openapi-generator-cli generate -g erlang-proper -i tools/gameserver.yaml -o apps/gs_proptests --additional-properties packageName=gs_proptests

