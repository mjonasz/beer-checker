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
_build/$MIX_ENV/rel/beer_checker/bin/beer_checker foreground # run app in foreground
```



