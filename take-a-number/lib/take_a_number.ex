defmodule TakeANumber do
  def start() do
    spawn(fn -> receiving(0) end)
  end

  defp receiving(state) do
    receive do
      {:report_state, pid} ->
        send(pid, state)
        receiving(state)

      {:take_a_number, pid} ->
        new_state = state + 1
        send(pid, new_state)
        receiving(new_state)

      :stop ->
        nil

      _ -> receiving(state)

    end
  end
end
