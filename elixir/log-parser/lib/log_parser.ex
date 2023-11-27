defmodule LogParser do
  def valid_line?(line) do
    String.match?(line, ~r/^(\[DEBUG\]|\[INFO\]|\[WARNING\]|\[ERROR\])/)
  end

  def split_line(line) do
    String.split(line, ~r/\<[=~\*\-]*\>/)
  end

  def remove_artifacts(line) do
    String.replace(line, ~r/end-of-line[\d]+/i, "")
  end

  def tag_with_user_name(line) do
    String.replace(line, ~r/(.*)User([\s]+)([^\s]+)([\s].*)?/, "[USER] \\3 \\1User\\2\\3\\4")
  end
end
