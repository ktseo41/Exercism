defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    do_extract_from_path(data, path)
  end
  defp do_extract_from_path(data, path) do
    if String.contains?(path, ".") do
      [first, rest] = String.split(path, ".", parts: 2)
      do_extract_from_path(data[first], rest)
    else
      data[path]
    end
  end

  def get_in_path(data, path) do
    if String.contains?(path, ".") do
      {result, _} = pop_in(data, String.split(path, "."))
      result
    else
      {result, _} = pop_in(data, [path])
      result
    end
  end
end
