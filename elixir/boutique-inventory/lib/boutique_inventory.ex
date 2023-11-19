defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price), :asc)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(&1.price === nil))
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, &(Map.replace(&1, :name, String.replace(&1.name, old_word, new_word))))
  end

  def increase_quantity(item, count) do
    item
    |> Enum.map(fn {key, value} ->
      if key === :quantity_by_size do
        {key,
         Map.new(
           Enum.map(value, fn {mapped_key, mapped_value} ->
             {mapped_key, mapped_value + count}
           end)
         )}
      else
        {key, value}
      end
    end)
    |> Map.new()
  end

  def total_quantity(item) do
    item
    |> Map.get(:quantity_by_size)
    |> Enum.reduce(0, &(elem(&1, 1) + &2))
  end
end
