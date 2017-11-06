# BeerChecker

**This application will check if certain beers are available to order at the moment.**

## Usage
It is possible to run this app locally or to release for standalone usage on remote server.

### Run locally
`iex -S mix`

### Run tests
`mix test`

### Release with distillery
```bash
export MIX_ENV=prod # or dev
mix release # create binaries
# upload _build/$MIX_ENV/rel/beer_checker to server
beer_checker/bin/beer_checker start # run in background
```
Logs can be found in `beer_checker/var/log/`



