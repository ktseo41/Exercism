defmodule PaintByNumber do
  def palette_bit_size(color_count, bit_size \\ 0) do
    if Integer.pow(2, bit_size) >= color_count do
      bit_size
    else
      palette_bit_size(color_count, bit_size + 1)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    if picture === "" do
      nil
    else
      bit_size = palette_bit_size(color_count)
      <<result::size(bit_size), _::bitstring>> = picture
      result
    end
  end

  def drop_first_pixel(picture, color_count) do
    if picture === "" do
      picture
    else
      bit_size = palette_bit_size(color_count)
      <<_::size(bit_size), rest::bitstring>> = picture
      rest
    end
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
