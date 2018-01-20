# BeerChecker

**Simple app to monitor rare beers sales with email notifications**

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
# on server
export REPLACE_OS_VARS=true # better add to some ~/.profile
beer_checker/bin/beer_checker start # run in background
```
Logs can be found in `~/beer_check.log` (remember to set `` environment variable)

### TODO
* implement repeater for HTTP client (there are random errors from time to time)
* extract **from** and **to** email fields to config (secret?)
* allow multiple email recipients
* systemd (start/stop/etc)
* logger configuration (/var/log/...)
* ansible (building and deployment)
* better tests
* add more beers to check


