defmodule It.Problems.Count do
  use Ecto.Schema
  import Ecto.Changeset

  schema "counts" do
    field :val, :integer

    timestamps()
  end

  @doc false
  def changeset(count, attrs) do
    count
    |> cast(attrs, [:val])
  end
end
