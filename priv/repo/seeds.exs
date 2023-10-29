# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Teacher.Repo.insert!(%Teacher.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Teacher.Products

widgets = [%{name: "Widget 1"}, %{name: "Widget 2"}, %{name: "Widget 3"}, %{name: "Widget 4"}]
Enum.each(widgets, fn(widget) -> Products.create_widget(widget) end)
