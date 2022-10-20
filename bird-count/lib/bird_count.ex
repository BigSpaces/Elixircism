defmodule BirdCount do
  # You have chosen to store the data as a list of integers. The first number in the list
  # is the number of birds that visited your garden today, the second yesterday, and so on.

  def today(list \\ nil) do
    if list == [] do
      nil
    else
      [today | _rest] = list
      today
    end
  end

  def increment_day_count(list) do
    if list == [] do
      [1]
    else
      List.update_at(list, 0, &(&1 + 1))
    end
  end

  def has_day_without_birds?([]), do: false

  def has_day_without_birds?([0 | _tail]), do: true

  def has_day_without_birds?([_head | tail]) do
    has_day_without_birds?(tail)
  end


   # Q, is this idiomatic? Why does it feel "weird" and non-poetic?
   # Also... it does not pass the tests. I find myself struggling to
   # translate tests results into plain English so I can diagonse.
  # def total([head | tail]) when tail == [], do: head

  # def total([head, head2 | tail]) do
  #   total([head + head2 | tail])
  # end
    # def total([], sum) do
    #   sum
    # end

    # def total(list, sum \\ 0) do

    #   [head | tail] = list
    #   total(tail, head + sum)
    # end

def total(list) do
 recursive_total(list, 0)
end

def recursive_total([], sum), do: sum

def recursive_total(list, sum) do
      [head | tail] = list
      recursive_total(tail, head + sum)
end

 # def busy_days(list) when tail == [] do: head





  #def busy_days([head | tail]) when tail == [], do: head

  #def busy_days([head | tail]) when head <= 5, do: 0

  #def busy_days([head | tail]) when head >= 5, do: 1


#   def busy_days([head |tail]) when tail == [], do: head

#   def busy_days([head | tail])

#  if head >= 5
#   end


  #   def busy_days(list) do
  #     Enum.reduce(list, 0, fn n, acc ->
  #       if n >= 5 do
  #         acc + 1
  #       else
  #         acc
  #       end
  #     end)
  #   end
end
