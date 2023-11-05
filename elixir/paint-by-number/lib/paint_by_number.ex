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
    # Please implement the prepend_pixel/3 function
    <<pixel_color_index::bitstring, picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    # Please implement the get_first_pixel/2 function
  end

  def drop_first_pixel(picture, color_count) do
    # Please implement the drop_first_pixel/2 function
  end

  def concat_pictures(picture1, picture2) do
    # Please implement the concat_pictures/2 function
  end
end
