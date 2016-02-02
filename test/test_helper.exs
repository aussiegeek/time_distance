defmodule TimeDistanceTestMacros do
  import ExUnit.Case
  use Timex
  defmacro __using__(_opts) do
    quote do
      import TimeDistanceTestMacros
    end
  end

  defmacro test_tuple(then, answer) do
    quote do
      {:ok, name} =
        unquote(then)
      |> Date.from
      |> DateFormat.format("{ISO:Basic}")
      test "elixir from #{name}"  do
        then = unquote(then)
        answer = unquote(answer)
        now = {{2016, 1, 30}, {14, 18, 38}}
        assert TimeDistance.distance_in_words(then, now) == answer
      end
    end
  end

  defmacro test_shift(kw, answer) do
    quote do
      {:ok, name} = Date.now |> Date.shift(unquote(kw)) |> DateFormat.format("{ISO:Basic}")
      test "timex from #{name}" do
        then = Date.now |> Date.shift(unquote(kw))
        assert TimeDistance.distance_in_words(then) == unquote(answer)
      end
    end
  end
end

ExUnit.start()

