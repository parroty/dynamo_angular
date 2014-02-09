defmodule Repo.Migrations.CreateCrews do
  use Ecto.Migration

  def up do
    %s"CREATE TABLE IF NOT EXISTS crew (
      id serial primary key,
      name varchar(256),
      description varchar(256))
    "
  end

  def down do
    "DROP TABLE crew"
  end
end

