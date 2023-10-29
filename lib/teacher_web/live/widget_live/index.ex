defmodule TeacherWeb.WidgetLive.Index do
  use TeacherWeb, :live_view

  alias Teacher.Products

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Widgets")
    |> assign(:widgets, Products.list_widgets())
  end

end
