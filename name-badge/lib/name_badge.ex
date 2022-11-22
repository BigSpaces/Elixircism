defmodule NameBadge do
  def print(id, name, department) do
    print_id = if id == nil, do:  "", else: "[#{id}] - "
    print_dep = if department == nil, do: " - OWNER", else: " - #{String.upcase(department)}"
    "#{print_id}#{name}#{print_dep}"
  end

end
