defmodule FileSniffer do
  def type_from_extension(extension) do
    case extension do
      "exe" -> "application/octet-stream"
      "bmp" -> "image/bmp"
      "png" -> "image/png"
      "jpg" -> "image/jpg"
      "gif" -> "image/gif"
      _ -> nil
    end
  end

  def type_from_binary(<<0x7F, 0x45, 0x4C, 0x46, _::binary>>) do
    type_from_extension("exe")
  end
  def type_from_binary(<<0x42, 0x4D, _::binary>>) do
    type_from_extension("bmp")
  end
  def type_from_binary(<<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _::binary>>) do
    type_from_extension("png")
  end
  def type_from_binary(<<0xFF, 0xD8, 0xFF, _::binary>>) do
    type_from_extension("jpg")
  end
  def type_from_binary(<<0x47, 0x49, 0x46, _::binary>>) do
    type_from_extension("gif")
  end
  def type_from_binary(_) do
    nil
  end

  def verify(file_binary, extension) do
    type_got_from_binary = type_from_binary(file_binary)
    type_got_from_extension = type_from_extension(extension)

    cond do
      type_got_from_binary === nil -> {:error, "Warning, file format and file extension do not match."}
      type_got_from_binary === type_got_from_extension -> {:ok, type_got_from_extension}
      true -> {:error, "Warning, file format and file extension do not match."}
    end
  end
end
