defmodule TeacherWeb.WidgetLive.Show do
  use TeacherWeb, :live_view

  alias Teacher.{Pricing, Products}

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    widget = Products.get_widget!(id)
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:price, fetch_price(widget))
     |> assign(:widget, widget)}
  end

  defp fetch_price(widget) do
    case Pricing.fetch_price(widget.name) do
      {:ok, price} ->
        price
      :error ->
        "Not available"
    end
  end

  defp page_title(:show), do: "Show Widget"
end
