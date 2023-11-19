defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort(inventory, &(&1.price <= &2.price))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(&1.price === nil))
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, &(Map.replace(&1, :name, String.replace(&1.name, old_word, new_word))))
  end

  def increase_quantity(item, count) do
    new_quantity_by_size = Map.get(item, :quantity_by_size)
    |> Enum.map(&{elem(&1, 0), elem(&1, 1) + count})
    |> Enum.into(%{})

    Map.replace(item, :quantity_by_size, new_quantity_by_size)
  end

  def total_quantity(item) do
    item
    |> Map.get(:quantity_by_size)
    |> Enum.reduce(0, &(elem(&1, 1) + &2))
  end
end
