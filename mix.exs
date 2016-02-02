defmodule TimeDistance.Mixfile do
  use Mix.Project

  def project do
    [app: :time_distance,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :tzdata]]
  end

  defp deps do
    [
      {:timex, "~> 1.0"},
      {:credo, "~> 0.2", only: [:dev, :test]},
      {:ex_doc, ">= 0.11.4", only: [:dev]},
    ]
  end
end