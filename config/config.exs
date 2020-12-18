# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :it,
  ecto_repos: [It.Repo]

# Configures the endpoint
config :it, ItWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6H8bHIsocxoscPJqrEMeVNGhRRL0+aAhwPx/FC3h9ETEtBlXUPpGbyNxy9rK4wMR",
  render_errors: [view: ItWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: It.PubSub,
  live_view: [signing_salt: "QNwOFE5D"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
