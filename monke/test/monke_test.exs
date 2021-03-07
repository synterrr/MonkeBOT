defmodule MonkeTest do
  use ExUnit.Case
  doctest Monke

  test "greets the world" do
    assert Monke.hello() == :world
  end
end
