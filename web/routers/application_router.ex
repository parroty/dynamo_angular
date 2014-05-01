defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    conn.fetch([:cookies, :params])
  end

  get "/" do
    render conn, "index.html"
  end

  @doc "list"
  get "/crews" do
    crews = Repo.all(Crew)
    conn.resp 200, Enum.map(crews, &Crew.to_list/1) |> JSEX.encode!
  end

  @doc "show"
  get "/crews/:id" do
    crew = Repo.get(Crew, get_id(conn.params))
    conn.resp 200, to_json(crew)
  end

  @doc "edit"
  get "/crews/:id/edit" do
    crew = Repo.get(Crew, get_id(conn.params))
    conn.resp 200, to_json(crew)
  end

  @doc "create"
  post "/crews" do
    crew = Crew.parse(conn.params) |> Crew.new
    Repo.insert(crew)
    conn.resp 200, to_json(crew)
  end

  @doc "update"
  put "/crews/:id" do
    crew = Repo.get(Crew, get_id(conn.params))
    Crew.parse(conn.params) |> crew.update |> Repo.update
    conn.resp 200, ""
  end

  @doc "destroy"
  delete "/crews/:id" do
    Repo.get(Crew, get_id(conn.params)) |> Repo.delete
    conn.resp 200, ""
  end

  defp to_json(crew) do
    Crew.to_list(crew) |> JSEX.encode!
  end

  defp get_id(param) do
    Dict.get(param, :id) |> binary_to_integer
  end
end
