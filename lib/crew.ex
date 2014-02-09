defmodule Crew do
  use Ecto.Model

  queryable "crew" do
    field :name, :string
    field :description, :string
  end

  def to_list(crew) do
    [ id: crew.id,
      name: crew.name,
      description: crew.description ]
  end

  def parse(params) do
    [ name: Dict.get(params, :name),
      description: Dict.get(params, :description) ]
  end
end
