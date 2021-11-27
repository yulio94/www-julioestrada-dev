# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :www_julioestrada_dev,
  ecto_repos: [WwwJulioestradaDev.Repo]

# Configures the endpoint
config :www_julioestrada_dev, WwwJulioestradaDevWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mdCqj57hvAUrX/2UzgA7s6vrsAMx8C9uSsLCRLU1E72l2c8knDKCYBi2vBQ/yijx",
  render_errors: [view: WwwJulioestradaDevWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: WwwJulioestradaDev.PubSub,
  live_view: [signing_salt: "LWz9Wk1h"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
