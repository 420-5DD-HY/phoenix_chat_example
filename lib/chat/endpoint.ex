defmodule Chat.Endpoint do
  use Phoenix.Endpoint, otp_app: :chat

  socket("/socket", Chat.UserSocket)

  # Serve at "/" the given assets from "priv/static" directory
  plug(Plug.Static, at: "/", from: :chat, only: ~w(css images js favicon.ico robots.txt))

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  if code_reloading? do
    socket("/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket)
    plug(Phoenix.CodeReloader)
    plug(Phoenix.LiveReloader)
  end

  plug(Plug.Logger)

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison
  )

  plug(Plug.MethodOverride)
  plug(Plug.Head)

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_chat_key",
    signing_salt: "LH6XmqGb",
    encryption_salt: "CIPZg4Qo"
  ]

  plug(Plug.MethodOverride)
  plug(Plug.Head)
  plug(Plug.Session, @session_options)
  plug(Chat.Router)
end
