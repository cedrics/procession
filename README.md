Procession
----------

This is a very simple library to draw a commandline progress bar.

Usage
=====
```ruby
require 'rubygems'
require 'procession'

max_value = 1000
pb = Procession::Bar.new(max_value)

max_value.times do |i|
  pb.update(i) do |current_i|
    "Where are at #{i}"
  end

  sleep 0.1
end
```
