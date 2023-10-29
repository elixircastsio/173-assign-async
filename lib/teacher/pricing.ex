defmodule Teacher.Pricing do

  def fetch_price(widget_name) do
    # simulates some service that fetches pricing data
    :timer.sleep(1250)
    Map.fetch(prices(), widget_name)
  end

  defp prices do
    %{
      "Widget 1" => 15.99,
      "Widget 2" => 19.99,
      "Widget 3" => 10.50
    }
  end

end
