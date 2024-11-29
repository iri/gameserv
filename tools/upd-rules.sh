sed -i.bak 's/\({host, \)"[^"]*"/\1"http:\/\/localhost:8080"/' apps/gs_proptests/src/gs_proptests.app.src
