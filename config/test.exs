import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :adopting_poolboy_web, AdoptingPoolboyWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "m8xqJjDQfkSzeCLMz3KWXpP8N7U56h4c2fnJQbBCjF1imAI+p0wW/H+KE+hP86Nn",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
