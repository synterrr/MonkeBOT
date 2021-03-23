defmodule Monke.MixProject do
  use Mix.Project

  def project do
    [
      app: :monke,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Monke, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:alchemy, "~> 0.6.8", hex: :discord_alchemy},
      {:jason, "~> 1.2"},
      {:httpoison, "~> 1.8"}

    ]
  end
end
