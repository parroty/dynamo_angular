defmodule Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def url do
    "ecto://postgres:postgres@localhost/ecto_simple"
  end

  def priv do
    app_dir(:dynamo_angular, "priv/repo")
  end
end
