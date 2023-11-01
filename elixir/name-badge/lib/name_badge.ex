defmodule NameBadge do
  @default_department "OWNER"
  def print(nil, name, nil) do
      "#{name} - #{@default_department}"
  end
  def print(id, name, nil) do
      "[#{id}] - #{name} - #{@default_department}"
  end
  def print(nil, name, department) do
      "#{name} - #{String.upcase(department)}"
  end
  def print(id, name, department) do
      "[#{id}] - #{name} - #{String.upcase(department)}"
  end
end
