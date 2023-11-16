defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    checked_out_before_noon? = before_noon?(checkout_datetime)

    if checked_out_before_noon? do
      Date.add(checkout_datetime, 28)
    else
      Date.add(checkout_datetime, 29)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    max(Date.diff(actual_return_datetime, planned_return_date), 0)
  end

  def monday?(datetime) do
    Date.day_of_week(datetime) === 1
  end

  def calculate_late_fee(checkout, return, rate) do
    {_, checkout_datetime, _} = DateTime.from_iso8601(checkout)
    {_, return_datetime, _} = DateTime.from_iso8601(return)
    planned_return_date = return_date(checkout_datetime)

    late_days = days_late(planned_return_date, return_datetime)
    is_monday? = monday?(return_datetime)
    is_before_noon? = before_noon?(checkout_datetime)

    case {is_monday?, is_before_noon?} do
      {true, true} -> if late_days > 28 do trunc((late_days - 28) * rate * 0.5) end
      {false, true} -> if late_days > 28 do (late_days - 28) * rate end
      {true, false} -> if late_days > 29 do trunc((late_days - 29) * rate * 0.5) end
      {false, false} -> if late_days > 29 do (late_days - 29) * rate end
      _ -> 0
    end
  end
end
