# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :atbash_cipher,
  ecto_repos: [AtbashCipher.Repo]

# Configures the endpoint
config :atbash_cipher, AtbashCipher.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UHgC7HvsotElDz6ifY7ao67yfjbV8jwc41ZKv3Dm54bBwAOUMqOjixw80OUej0Sg",
  render_errors: [view: AtbashCipher.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AtbashCipher.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
