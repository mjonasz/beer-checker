use Mix.Config

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

config :logger, level: :debug

import_config "#{Mix.env}.exs"