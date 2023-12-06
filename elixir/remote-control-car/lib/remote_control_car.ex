defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(remote_car = %RemoteControlCar{}) do
    "#{remote_car.distance_driven_in_meters} meters"
  end

  def display_battery(remote_car = %RemoteControlCar{}) when remote_car.battery_percentage === 0 do
    "Battery empty"
  end
  def display_battery(remote_car = %RemoteControlCar{}) do
    "Battery at #{remote_car.battery_percentage}%"
  end

  def drive(remote_car = %RemoteControlCar{}) when remote_car.battery_percentage >= 1 do
    remote_car
      |> Map.update!(:distance_driven_in_meters, fn v -> v + 20 end)
      |> Map.update!(:battery_percentage, fn v -> v - 1 end)
  end
  def drive(remote_car = %RemoteControlCar{}) do
    remote_car
  end
end
