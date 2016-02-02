# TimeDistance

Show the difference between two specified times, or between a specified time and now

## Example results:

* 2 seconds ago
* 6 months ago
* 3 days
* 2 years

Works with Elixir time structs or [Timex](https://hex.pm/timex)

A rough port of distance_of_time_in_words from Ruby on Rails

## Installation


  1. Add time_distance to your list of dependencies in `mix.exs`:

        def deps do
          [{:time_distance, "~> 0.0.1"}]
        end

  2. Ensure time_distance is started before your application:

        def application do
          [applications: [:time_distance]]
        end

