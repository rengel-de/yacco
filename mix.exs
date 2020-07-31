defmodule Yacco.MixProject do
  use Mix.Project

  def project do
    [
      app: :yacco,
      version: "0.1.0",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      source_url: "https://github.com/rengel-de/yacco"
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Yacco.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5.4"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_dashboard, "~> 0.2"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:calixir, "~> 0.1.0"},
      {:calendars, "~> 0.1.0"}
    ]
  end

  defp description() do
    """
    Yacco (Yet another calendar converter) is an ELixir/Phoenix application
    that allows the conversion of calendar dates of the calendars contained
    in the packages Calixir and Calendars.
    """
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "cmd npm install --prefix assets"]
    ]
  end

  defp package() do
    [
      name: "yacco",
      # These are the default files included in the package
      files: ~w(.formatter.exs mix.exs README.md COPYRIGHT*
                 .gitignore assets lib test),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/rengel-de/yacco"}
    ]
  end

end
