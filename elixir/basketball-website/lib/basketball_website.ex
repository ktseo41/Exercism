defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    do_extract_from_path(data, String.split(path, "."))
  end
  defp do_extract_from_path(data, []) do data end
  defp do_extract_from_path(data, [first | rest]) do
    do_extract_from_path(data[first], rest)
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
