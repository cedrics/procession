module Procession
  class Bar
    attr_accessor :max

    def initialize(max)
      @max = max
    end

    def update(item, &block)
      @item = item
      print_progress(&block)
    end

    private

    def print_progress(&block)
      additional_info = if block_given?
        yield percent
      else
        ""
      end

      print "\e[#{@last_line.length}D" if @last_line

      @last_line = "#{progress_bar} #{additional_info}"
      print @last_line
    end

    def progress_bar
      "[#{symbol*symbols}#{" "*(20-symbols)}] #{percent}%"
    end

    def percent
      ((@item / @max.to_f) * 100).floor
    end

    def symbols
      (percent / 5).floor
    end

    def symbol
      Procession.symbol
    end
  end
end
