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

Configuration
============

- `Procession.symbol` The symbol to draw the progres bar (Default: #)
- `Procession.template` The template of the output string (Default: "[%bar] %percent% %text")
- `Procession.length` The number of symbols in the progress bar (Default: 20)

Template
========
The template is a string that can contain certain special keys that will be replaced:
- %bar replaced by the progress bar
- %percent replaced by the percent number
- %text additional info added with the block to the update call
- %time remaining time of the execution
