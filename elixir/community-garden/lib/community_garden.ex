# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  use Agent

  def start(opts \\ []) do
    Agent.start(fn -> {0, []} end)
  end

  def list_registrations(pid) do
    Agent.get(pid, &(elem(&1, 1)))
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn {current_pid, list} ->
      new_plot = %Plot{plot_id: current_pid + 1, registered_to: register_to}
      {new_plot, {current_pid + 1, [new_plot | list]}}
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn {current_pid, list} -> {current_pid, Enum.filter(list, fn plot -> plot.plot_id !== plot_id end)} end)
  end

  def get_registration(pid, plot_id) do
    plot = Agent.get(pid, fn {_, list} -> Enum.find(list, fn plot -> plot.plot_id === plot_id end) end)

    case plot do
      nil -> {:not_found, "plot is unregistered"}
      _ -> plot
    end
  end
end
