# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :beer_checker, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:beer_checker, :key)
#
# You can also configure a 3rd-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"

# read email username and password from separate file
import_config "email.secret.exs"

config :beer_checker, BeerChecker.Mailer,
       adapter: Bamboo.SMTPAdapter,
       server: "smtp.gmail.com",
       hostname: "gmail.com",
       port: 587 ,
       tls: :always, # can be `:always` or `:never`
       allowed_tls_versions: [:"tlsv1.2"], # or {":system", ALLOWED_TLS_VERSIONS"} w/ comma seprated values (e.g. "tlsv1.1,tlsv1.2")
       ssl: false,
       retries: 2