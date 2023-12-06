defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, opts \\ []) do
    maximum_price = Keyword.get(opts, :maximum_price, 100.00)
    for top <- tops,
        bottom <- bottoms, top.price + bottom.price <= maximum_price and top.base_color !== bottom.base_color do
        {top, bottom}
    end
  end
end
