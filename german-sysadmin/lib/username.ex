defmodule Username do
  def sanitize(username) do
    filter_lowercase(username, [])
  end

  defp filter_lowercase([], final_list) do
    final_list
  end

  defp filter_lowercase(chls, final_list) when hd(chls) >= ?a and hd(chls) <= ?z do
    filter_lowercase(tl(chls), final_list ++ [hd(chls)])
  end

  defp filter_lowercase(chls, final_list) when hd(chls) == ?_ do
    filter_lowercase(tl(chls), final_list ++ [hd(chls)])
  end

  defp filter_lowercase(chls, final_list) do
    case hd(chls) do
      ?ä ->
        filter_lowercase(tl(chls), final_list ++ [97, 101])

      ?ö ->
        filter_lowercase(tl(chls), final_list ++ [111, 101])

      ?ü ->
        filter_lowercase(tl(chls), final_list ++ [117, 101])

      ?ß ->
        filter_lowercase(tl(chls), final_list ++ [115, 115])

      _ ->
        filter_lowercase(tl(chls), final_list)
    end
  end
end
