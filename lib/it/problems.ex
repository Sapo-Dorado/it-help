defmodule It.Problems do
  import Ecto.Query, warn: false
  alias It.Repo

  alias It.Problems.Count

  def get_count!() do
    Repo.get!(Count, 1).val
  end

  def inc_count() do
    from(c in Count, where: c.id == 1)
    |> Repo.update_all(inc: [val: 1])
  end

  def create_count() do
    %Count{}
    |> Count.changeset(%{val: 0})
    |> Repo.insert()
  end
end
