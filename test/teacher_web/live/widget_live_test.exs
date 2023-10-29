defmodule TeacherWeb.WidgetLiveTest do
  use TeacherWeb.ConnCase

  import Phoenix.LiveViewTest
  import Teacher.ProductsFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_widget(_) do
    widget = widget_fixture()
    %{widget: widget}
  end

  describe "Index" do
    setup [:create_widget]

    test "lists all widgets", %{conn: conn, widget: widget} do
      {:ok, _index_live, html} = live(conn, ~p"/widgets")

      assert html =~ "Listing Widgets"
      assert html =~ widget.name
    end

    test "saves new widget", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/widgets")

      assert index_live |> element("a", "New Widget") |> render_click() =~
               "New Widget"

      assert_patch(index_live, ~p"/widgets/new")

      assert index_live
             |> form("#widget-form", widget: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#widget-form", widget: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/widgets")

      html = render(index_live)
      assert html =~ "Widget created successfully"
      assert html =~ "some name"
    end

    test "updates widget in listing", %{conn: conn, widget: widget} do
      {:ok, index_live, _html} = live(conn, ~p"/widgets")

      assert index_live |> element("#widgets-#{widget.id} a", "Edit") |> render_click() =~
               "Edit Widget"

      assert_patch(index_live, ~p"/widgets/#{widget}/edit")

      assert index_live
             |> form("#widget-form", widget: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#widget-form", widget: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/widgets")

      html = render(index_live)
      assert html =~ "Widget updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes widget in listing", %{conn: conn, widget: widget} do
      {:ok, index_live, _html} = live(conn, ~p"/widgets")

      assert index_live |> element("#widgets-#{widget.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#widgets-#{widget.id}")
    end
  end

  describe "Show" do
    setup [:create_widget]

    test "displays widget", %{conn: conn, widget: widget} do
      {:ok, _show_live, html} = live(conn, ~p"/widgets/#{widget}")

      assert html =~ "Show Widget"
      assert html =~ widget.name
    end

    test "updates widget within modal", %{conn: conn, widget: widget} do
      {:ok, show_live, _html} = live(conn, ~p"/widgets/#{widget}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Widget"

      assert_patch(show_live, ~p"/widgets/#{widget}/show/edit")

      assert show_live
             |> form("#widget-form", widget: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#widget-form", widget: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/widgets/#{widget}")

      html = render(show_live)
      assert html =~ "Widget updated successfully"
      assert html =~ "some updated name"
    end
  end
end
