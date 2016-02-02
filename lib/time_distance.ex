defmodule TimeDistance do
  @moduledoc """
Show the difference between two specified times, or between a specified time and now

## Example results:

* 2 seconds ago
* 6 months ago
* 3 days
* 2 years
"""
  use Timex

  @doc """
Distance of times in words for a date in the past or the future.
Supports elixir native times, or Timex.DateTime

## Using Timex
```
iex> {:ok, now} = DateFormat.parse("2016-01-01", "{YYYY}-{0M}-{0D}")
...> {:ok, then} = DateFormat.parse("2015-01-01", "{YYYY}-{0M}-{0D}")
...> TimeDistance.distance_in_words(then, now)
"1 year ago"

```

## Using native elixir dates

```
iex> now = {{2016, 1, 1}, {14, 18, 38}}
...> then = {{2015, 12, 1}, {14, 18, 38}}
...> TimeDistance.distance_in_words(then, now)
"4 weeks ago"

```

"""
  def distance_in_words(%Timex.DateTime{} = then, %Timex.DateTime{} = now), do: seconds(Date.diff(now, then, :secs), then, now)
  def distance_in_words(then, now), do: distance_in_words(Date.from(then), Date.from(now))
  def distance_in_words(%Timex.DateTime{} = then), do: distance_in_words(then, Date.now)
  def distance_in_words(then), do: distance_in_words(then, :calendar.universal_time())
  defp seconds(-1, _, _), do: "1 second ago"
  defp seconds(0, _, _), do: "now"
  defp seconds(1, _, _), do: "1 second"
  defp seconds(n, _, _) when n >= 2 and n < 60, do: "#{n} seconds"
  defp seconds(n, _, _) when n <= -2 and n > -60, do: "#{abs(n)} seconds ago"
  defp seconds(n, then, now) when n >=60 or n <= -60, do: minutes(Date.diff(now,then, :mins), then, now)

  defp minutes(-1, _, _), do: "1 minute ago"
  defp minutes(1, _, _), do: "1 minute"
  defp minutes(n, _, _) when n >= 2 and n < 60, do: "#{n} minutes"
  defp minutes(n, _, _) when n <= -2 and n > -60, do: "#{abs(n)} minutes ago"
  defp minutes(n, then, now) when n >= 60 or n <= -60, do: hours(Date.diff(now, then, :hours), then, now)

  defp hours(-1, _, _), do: "1 hour ago"
  defp hours(1, _, _), do: "1 hour"
  defp hours(n, _, _) when n >= 2 and n < 24, do: "#{n} hours"
  defp hours(n, _, _) when n <= 2 and n > -24, do: "#{abs(n)} hours ago"
  defp hours(n, then, now) when n >= 24 or n <= -24, do: days(Date.diff(now, then, :days), then, now)

  defp days(-1, _, _), do: "1 day ago"
  defp days(1, _, _), do: "1 day"
  defp days(n, _, _) when n >= 2 and n < 7, do: "#{n} days"
  defp days(n, _, _) when n <= -2 and n > -7, do: "#{abs(n)} days ago"
  defp days(n, then, now) when n > 6 or n < -6, do: weeks(Date.diff(now, then, :weeks), then, now)

  defp weeks(-1, _, _), do: "1 week ago"
  defp weeks(1, _, _), do: "1 week"
  defp weeks(n, _, _) when n >= 2 and n < 5, do: "#{n} weeks"
  defp weeks(n, _, _) when n <= -2 and n > -5, do: "#{abs(n)} weeks ago"
  defp weeks(n, then, now) when n >= 5, do: months(Date.diff(now, then, :months), then, now)
  defp weeks(n, then, now) when n <= -5, do: months(Date.diff(now, then, :months), then, now)

  defp months(-1, _, _), do: "1 month ago"
  defp months(n, _, _) when n >= 2 and n < 12, do: "#{n} months"
  defp months(n, _, _) when n <= -2 and n > -12, do: "#{abs(n)} months ago"
  defp months(n, then, now) when n >= 12 or n <= -12, do: years(Date.diff(now, then, :years), then, now)

  defp years(-1, _, _), do: "1 year ago"
  defp years(1, _, _), do: "1 year"
  defp years(n, _, _) when n > 1, do: "#{n} years"
  defp years(n, _, _) when n < 1, do: "#{abs(n)} years ago"
end
