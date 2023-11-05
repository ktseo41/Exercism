defmodule WineCellar do
  def explain_colors do
    [white: "Fermented without skin contact.", red: "Fermented with skin contact using dark-colored grapes.", rose: "Fermented with some skin contact, but not enough to qualify as a red wine."]
  end

  def filter(cellar, color, opts \\ []) do
    Keyword.get_values(cellar, color)
    |> maybe_filter(Keyword.get(opts, :year), :year)
    |> maybe_filter(Keyword.get(opts, :country), :country)
  end

  defp maybe_filter(wines, nil, _), do: wines
  defp maybe_filter(wines, year, :year), do: filter_by_year(wines, year)
  defp maybe_filter(wines, country, :country), do: filter_by_country(wines, country)

  # ---

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
