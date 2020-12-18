defmodule It.Repo.Migrations.CreateCounts do
  use Ecto.Migration

  def change do
    create table(:counts) do
      add :val, :integer

      timestamps()
    end

  end
end
