defmodule Teacher.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Teacher.Products` context.
  """

  @doc """
  Generate a widget.
  """
  def widget_fixture(attrs \\ %{}) do
    {:ok, widget} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Teacher.Products.create_widget()

    widget
  end
end
