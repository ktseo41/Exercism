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
      get_in(data, String.split(path, "."))
    else
      get_in(data, [path])
    end
  end
end
