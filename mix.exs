defmodule DynamoAngular.Mixfile do
  use Mix.Project

  def project do
    [ app: :dynamo_angular,
      version: "0.0.1",
      build_per_environment: true,
      dynamos: [DynamoAngular.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { DynamoAngular, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :postgrex, "~> 0.5" },
      { :ecto, "~> 0.2"},
      { :dynamo, "~> 0.1.0-dev", github: "dynamo/dynamo" },
      { :jsex, github: "talentdeficit/jsex"} ]
  end
end
