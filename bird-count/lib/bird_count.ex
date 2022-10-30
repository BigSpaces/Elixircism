defmodule BirdCount do
  def today([]), do: nil
  def today([count | _other_days]), do: count

  def increment_day_count([]), do: [1]
  def increment_day_count([today | others]), do:  [today + 1 | others ]
  
  def has_day_without_birds?([]), do: false
def has_day_without_birds?([today | _others]) when today == 0, do: true
def has_day_without_birds?([today | others]) when today > 0, do: has_day_without_birds?(others)  

  

  def total([]), do: 0 
  def total([acc |[]]), do: acc
  def total([today | other_days]), do: total([today + hd(other_days) | tl(other_days)])

  def busy_days([]), do: 0
  def busy_days(list), do: busy_days(list, 0) 
  def busy_days([], total), do: total
  def busy_days([today | next_days], total) when today < 5, do: busy_days(next_days, total)
  def busy_days([today | next_days], total) when today >= 5, do: busy_days(next_days, total + 1)
  

end
