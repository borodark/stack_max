defmodule StackMaxTest do
  use ExUnit.Case

  test "empty stack" do
    assert {:error, "Empty stack"} == StackMax.pop(%{max: [], stack: []}) 
  end

  test "pop max" do
    assert {%{max: [1], stack: [1]}, 2}  == StackMax.pop(%{max: [2,1], stack: [2,1]}) 
  end

  test "pop max 2" do
    assert {%{max: [4,2,1], stack: [1,4,2,1]},3}  == StackMax.pop(%{max: [4,2,1], stack: [3,1,4,2,1]}) 
  end

  test "pop not max" do
    assert {%{max: [2,1], stack: [2,1]},1}  == StackMax.pop(%{max: [2,1], stack: [1,2,1]})
  end

  test "push one " do
    assert %{max: [1], stack: [1]}  == StackMax.push(%{max: [], stack: []}, 1) 
  end

  test "push two " do
    assert %{max: [2,1], stack: [2,1]}  == StackMax.push(%{max: [1], stack: [1]}, 2) 
  end

  test "push three " do
    assert %{max: [2,1], stack: [1,2,1]}  == StackMax.push(%{max: [2,1], stack: [2,1]}, 1) 
  end

  test "push many proff UP" do
    rc = %{max: [8,3,1], stack: [4,2,8,3,1]}
    assert rc  == StackMax.push(%{max: [], stack: []}, 1)
    |> StackMax.push(3)
    |> StackMax.push(8)
    |> StackMax.push(2)
    |> StackMax.push(4)
    rc1 = StackMax.pop rc
    assert { %{max: [8,3,1], stack: [2,8,3,1]}, 4}  == rc1
  end

  test "push many proff DOWN" do
    rc = %{max: [8], stack: [4,2,1,5,8]}
    assert rc  == StackMax.push(%{max: [], stack: []}, 8)
    |> StackMax.push(5)
    |> StackMax.push(1)
    |> StackMax.push(2)
    |> StackMax.push(4)
    rc1 = StackMax.pop rc
    assert { %{max: [8], stack: [2,1,5,8]}, 4}  == rc1
  end

end
