#!/bin/sh
rm -rf _build/prod
mix local.hex --force
mix local.rebar --force
MIX_ENV=prod mix release
