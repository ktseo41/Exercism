defmodule FileSniffer do
  def type_from_extension(extension) do
    case extension do
      "exe" -> "application/octet-stream"
      "bmg" -> "image/bmp"
      "png" -> "image/png"
      "jpg" -> "image/jpg"
      "gif" -> "image/gif"
      _ -> nil
    end
  end

  def type_from_binary(file_binary) do
    <<first_byte::binary-size(8), rest_file_binary::binary>> = file_binary
    case first_byte do
      <<0x7F>> -> do_type_from_binary(rest_file_binary, [<<0x45, 0x4C, 0x46>>], type_from_extension("exe"))
      <<0x42>> -> do_type_from_binary(rest_file_binary, [<<0x4D>>], type_from_extension("bmp"))
      <<0x89>> -> do_type_from_binary(rest_file_binary, [<<0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A>>], type_from_extension("png"))
      <<0xFF>> -> do_type_from_binary(rest_file_binary, [<<0xD8, 0xFF>>], type_from_extension("jpg"))
      <<0x47>> -> do_type_from_binary(rest_file_binary, [<<0x49, 0x46>>], type_from_extension("gif"))
      _ -> nil
    end
  end
  defp do_type_from_binary(file_binary, remain_signature, media_type) do
    if length(remain_signature) === 0 do
      media_type
    else
      <<first_byte::binary-size(8), rest_file_binary::binary>> = file_binary
      [match_signature | rest_signature] = remain_signature

      if first_byte === match_signature do
        do_type_from_binary(rest_file_binary, rest_signature, media_type)
      end
    end
  end

  def verify(file_binary, extension) do
    # Please implement the verify/2 function
  end
end
