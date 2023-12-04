defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new() do
    %RemoteControlCar{nickname: "none"}
  end
  def new(nickname) do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(remote_car) do
    %{RemoteControlCar.new() | nickname: "none"}
    %{RemoteControlCar.new() | battery_percentage: "none"}
    %{RemoteControlCar.new() | distance_driven_in_meters: "none"}

    "#{remote_car.distance_driven_in_meters} meters"
  end

  def display_battery(remote_car) when remote_car.battery_percentage === 0 do
    "Battery empty"
  end
  def display_battery(remote_car) do
    "Battery at #{remote_car.battery_percentage}%"
  end

  def drive(remote_car) do
    # Please implement the drive/1 function
  end
end
