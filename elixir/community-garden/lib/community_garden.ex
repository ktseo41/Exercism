# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  use Agent

  def start(opts \\ []) do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def list_registrations(pid) do
    Agent.get(__MODULE__, &(Enum.filter(&1, fn p -> p.plot_id === pid end)))
  end

  def register(pid, register_to) do
    new_plot = %Plot{plot_id: pid, registered_to: register_to}
    Agent.update(__MODULE__, &([new_plot | &1]))
    new_plot
  end

  def release(pid, plot_id) do
    # Please implement the release/2 function
  end

  def get_registration(pid, plot_id) do
    # Please implement the get_registration/2 function
  end
end
