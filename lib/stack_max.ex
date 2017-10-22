defmodule StackMax do

  def pop(%{max: [], stack: []}) do
    {:error, "Empty stack"}
  end

  def pop(%{max: [max_head|max_tail], stack: [stack_head|stack_tail]}) do
    case stack_head == max_head do 
      true -> {%{max: max_tail, stack: stack_tail},stack_head} # popping out max value
      false -> {%{max: [max_head|max_tail], stack: stack_tail},stack_head} # keep max
    end

  end

  def push(%{max: [], stack: []}, newValue) do
    %{max: [newValue], stack: [newValue]}
  end

  def push(%{max: max, stack: stack}, newValue) do
    [h|t] = max
    case newValue > h do
      true -> %{max: [newValue|max], stack: [newValue|stack]}
      false -> %{max: max, stack: [newValue|stack]} 
    end
  end

end
