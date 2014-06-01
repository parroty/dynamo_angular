defmodule Crew do
  use Ecto.Model

  schema "crew" do
    field :name, :string
    field :description, :string
  end

  def to_list(crew) do
    [ id: crew.id,
      name: crew.name,
      description: crew.description ]
  end

  def parse(params) do
    %{ name: params[:name],
      description: params[:description] }
  end
end
