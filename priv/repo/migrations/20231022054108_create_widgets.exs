defmodule Teacher.Repo.Migrations.CreateWidgets do
  use Ecto.Migration

  def change do
    create table(:widgets) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
