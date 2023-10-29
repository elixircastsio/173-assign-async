defmodule Teacher.WidgetData do

  def fetch_price(widget_name) do
    # simulates some service that fetches pricing data
    :timer.sleep(1250)
    if Map.has_key?(prices(), widget_name) do
      Map.fetch!(prices(), widget_name)
    else
      nil
    end
  end

  def fetch_quantities(widget_name) do
    # simulates some service that fetches pricing data
    :timer.sleep(1250)
    if Map.has_key?(quantities(), widget_name) do
      Map.fetch!(quantities(), widget_name)
    else
      nil
    end
  end

  defp prices do
    %{
      "Widget 1" => 15.99,
      "Widget 2" => 19.99,
      "Widget 3" => 10.50
    }
  end

  defp quantities do
    %{
      "Widget 1" => 4,
      "Widget 2" => 10,
      "Widget 3" => 25
    }
  end

end
