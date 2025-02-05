# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :grab_cikgu_api,
  ecto_repos: [GrabCikguApi.Repo]

# Configures the endpoint
config :grab_cikgu_api, GrabCikguApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "e3ZQCqBq2ALAyiu7HhwGRlKVsTRgjcZFqkXQpraqk9vwO0a86Ec3ENwAAjJqbvfy",
  render_errors: [view: GrabCikguApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: GrabCikguApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
