defmodule Chat.Mixfile do
  use Mix.Project

  def project do
    [ app: :chat,
      version: "0.0.1",
      elixir: "~> 0.13.0",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [mod: { Chat, [] }]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [
      {:jazz, github: "meh/jazz"},
      {:phoenix, "0.2.1"},
      {:cowboy, github: "extend/cowboy", override: true, ref: "05024529679d1d0203b8dcd6e2932cc2a526d370"},
    ]
  end
end
