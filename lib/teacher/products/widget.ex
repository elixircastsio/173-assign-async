defmodule Teacher.Products.Widget do
  use Ecto.Schema
  import Ecto.Changeset

  schema "widgets" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(widget, attrs) do
    widget
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
