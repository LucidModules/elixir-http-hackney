defmodule LmHttpHackney.MixProject do
  use Mix.Project

  @source_url "https://github.com/LucidModules/elixir-http-hackney"
  @version "0.1.0"

  def project do
    [
      app: :lm_http_hackney,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Hex
      description: "Hackney implementation for the Lucid Modules HTTP",
      package: package(),

      # Docs
      name: "Lucid Modules HTTP Hackney",
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:lm_http, git: "https://github.com/LucidModules/elixir-http", branch: "master"},
      {:hackney, "~> 1.18"},
      {:ex_doc, "~> 0.1", only: :dev},
      {:earmark, ">= 0.0.0", only: :dev},
      {:credo, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:mock, "~> 0.3", only: :test},
      {:mix_test_watch, "~> 0.8", only: :dev, runtime: false},
      {:floki, ">= 0.30.0", only: :test}
    ]
  end

  defp package do
    [
      name: "lm_http_hackney",
      maintainers: ["Matt Chad"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      name: "Lucid Modules HTTP Hackney",
      source_url: @source_url,
      homepage_url: @source_url
    ]
  end
end
