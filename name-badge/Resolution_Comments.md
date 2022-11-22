# Comments on Name Badge

An easy one to go through. I first started using different function definitions, to account for each potential input: 

´´´
def print(nil, name, nil) do
   IO.puts("#{name} - OWNER")
end

def print(id, name, nil) do
   IO.puts("[#{id}] - #{name} - OWNER")
end

def print(nil, name, department) do
  IO.puts("#{name} - #{String.upcase(department)}")
end
```

Exercism requested that I use an IF statement. I initially thought it would make the code trickier to read, but then this came up:

```
 def print(id, name, department) do
    print_id = if id == nil, do:  "", else: "[#{id}] - "
    print_dep = if department == nil, do: " - OWNER", else: " - #{String.upcase(department)}"
    "#{print_id}#{name}#{print_dep}"
  end
```

I still intuit there is a third refactor that would make the code even more elegant. I found it in one of the community solutions:

```
id_str <> name <> dpt_str
```



