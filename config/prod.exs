use Mix.Config

# tell logger to load a LoggerFileBackend processes
config :logger,
       backends: [{LoggerFileBackend, :debug_log}]

config :logger, :debug_log,
       path: "${HOME}/beer_checker.log",
       level: :debug