# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :todolist,
  ecto_repos: [Todolist.Repo]

config :todolist, :pow,
  user: Todolist.Users.User,
  repo: Todolist.Repo

# Configures the endpoint
config :todolist, TodolistWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "huPT3sM1cULmf/dBg98O/szc8irg3U5p7juNizQWry2oKkHs6vI7RZHjGVs8Mfyh",
  render_errors: [view: TodolistWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Todolist.PubSub,
  live_view: [signing_salt: "Zkp5AF+3"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
