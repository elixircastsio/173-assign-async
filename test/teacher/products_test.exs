defmodule Teacher.ProductsTest do
  use Teacher.DataCase

  alias Teacher.Products

  describe "widgets" do
    alias Teacher.Products.Widget

    import Teacher.ProductsFixtures

    @invalid_attrs %{name: nil}

    test "list_widgets/0 returns all widgets" do
      widget = widget_fixture()
      assert Products.list_widgets() == [widget]
    end

    test "get_widget!/1 returns the widget with given id" do
      widget = widget_fixture()
      assert Products.get_widget!(widget.id) == widget
    end

    test "create_widget/1 with valid data creates a widget" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Widget{} = widget} = Products.create_widget(valid_attrs)
      assert widget.name == "some name"
    end

    test "create_widget/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_widget(@invalid_attrs)
    end

    test "update_widget/2 with valid data updates the widget" do
      widget = widget_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Widget{} = widget} = Products.update_widget(widget, update_attrs)
      assert widget.name == "some updated name"
    end

    test "update_widget/2 with invalid data returns error changeset" do
      widget = widget_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_widget(widget, @invalid_attrs)
      assert widget == Products.get_widget!(widget.id)
    end

    test "delete_widget/1 deletes the widget" do
      widget = widget_fixture()
      assert {:ok, %Widget{}} = Products.delete_widget(widget)
      assert_raise Ecto.NoResultsError, fn -> Products.get_widget!(widget.id) end
    end

    test "change_widget/1 returns a widget changeset" do
      widget = widget_fixture()
      assert %Ecto.Changeset{} = Products.change_widget(widget)
    end
  end
end
