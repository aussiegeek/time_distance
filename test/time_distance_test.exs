defmodule TimeDistanceTest do
  use ExUnit.Case
  use Timex
  use TimeDistanceTestMacros

  doctest TimeDistance

  test_tuple {{2016,1,29}, {14, 18, 38}}, "1 day ago"
  test_tuple {{2016,1,28}, {14, 18, 38}}, "2 days ago"
  test_tuple {{2016,1,24}, {14, 18, 38}}, "6 days ago"
  test_tuple {{2016,1,23}, {14, 18, 38}}, "1 week ago"
  test_tuple {{2016,1,17}, {14, 18, 38}}, "1 week ago"
  test_tuple {{2016,1,10}, {14, 18, 38}}, "2 weeks ago"
  test_tuple {{2016,1,9}, {14, 18, 38}}, "3 weeks ago"
  test_tuple {{2016,1,3}, {14, 18, 38}}, "3 weeks ago"
  test_tuple {{2016,1,2}, {14, 18, 38}}, "4 weeks ago"
  test_tuple {{2016,1,1}, {14, 18, 38}}, "4 weeks ago"
  test_tuple {{2015,12,26}, {14, 18, 38}}, "1 month ago"

  test_tuple {{2016, 1, 31}, {14, 18, 38}}, "1 day"
  test_tuple {{2016, 2, 1}, {14, 18, 38}}, "2 days"
  test_tuple {{2016, 2, 5}, {14, 18, 38}}, "6 days"
  test_tuple {{2016, 2, 6}, {14, 18, 38}}, "1 week"
  test_tuple {{2016, 2, 13}, {14, 18, 38}}, "2 weeks"
  test_tuple {{2016, 2, 20}, {14, 18, 38}}, "3 weeks"
  test_tuple {{2016, 3, 5}, {14, 18, 38}}, "2 months"
  test_tuple {{2016, 12, 6}, {14, 18, 38}}, "11 months"
  test_tuple {{2017, 1, 30}, {14, 18, 38}}, "1 year"
  test_tuple {{2018, 1, 30}, {14, 18, 38}}, "2 years"

  test "now elixir" do
    assert TimeDistance.distance_in_words(:calendar.universal_time()) == "now"
  end

  test "now timex" do
    assert TimeDistance.distance_in_words(Date.now) == "now"
  end

  test_shift [secs: -1], "1 second ago"
  test_shift [secs: -2], "2 seconds ago"
  test_shift [secs: -59], "59 seconds ago"
  test_shift [mins: -1], "1 minute ago"
  test_shift [mins: -2], "2 minutes ago"
  test_shift [mins: -59], "59 minutes ago"
  test_shift [hours: -1], "1 hour ago"
  test_shift [hours: -2], "2 hours ago"
  test_shift [hours: -23], "23 hours ago"
  test_shift [days: -1], "1 day ago"
  test_shift [days: -2], "2 days ago"
  test_shift [days: -6], "6 days ago"
  test_shift [weeks: -1], "1 week ago"
  test_shift [weeks: -4], "4 weeks ago"
  test_shift [months: -2], "2 months ago"
  test_shift [months: -11], "11 months ago"
  test_shift [months: -12], "1 year ago"
  test_shift [months: -24], "2 years ago"
  test_shift [months: -36], "3 years ago"

  test_shift [secs: 1], "1 second"
  test_shift [secs: 2], "2 seconds"
  test_shift [secs: 59], "59 seconds"
  test_shift [mins: 1], "1 minute"
  test_shift [mins: 2], "2 minutes"
  test_shift [mins: 59], "59 minutes"
  test_shift [hours: 1], "1 hour"
  test_shift [hours: 2], "2 hours"
  test_shift [hours: 23], "23 hours"
  test_shift [days: 1], "1 day"
  test_shift [days: 2], "2 days"
  test_shift [days: 6], "6 days"
  test_shift [weeks: 1], "1 week"
  test_shift [weeks: 4], "4 weeks"
  test_shift [months: 2], "2 months"
  test_shift [months: 11], "11 months"
  test_shift [months: 12], "1 year"
  test_shift [months: 24], "2 years"
  test_shift [months: 36], "3 years"
end
