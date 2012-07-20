module Procession
  class Bar
    attr_accessor :max, :out, :template, :length

    def initialize(max, out=$stdout)
      @max = max
      @out = out
    end

    def update(item, &block)
      @first_update ||= Time.now

      @item = item
      print_progress(&block)
    end

    def template
      @template ||= Procession.template || "[%bar] %percent% %text"
    end

    def length
      @length ||= Procession.length || 20
    end

    private

    def print_progress(&block)
      additional_info = if block_given?
        yield percent
      else
        ""
      end

      clear(@last_line.length) if !@last_line.nil?

      @last_line = build_bar(additional_info)
      out.write @last_line
    end

    def clear(number_of_chars)
      @out.write "\e[#{number_of_chars}D"
    end

    def build_bar(additional_info)
      self.template.gsub('%bar', progress_bar).gsub('%percent', percent.to_s).gsub('%text', additional_info.to_s).gsub('%time', time)
    end

    def progress_bar
      "#{symbol*symbols}#{" "*(length-symbols)}"
    end

    def percent
      ((@item / @max.to_f) * 100).floor
    end

    def symbols
      (percent / (100 / length.to_f)).floor
    end

    def symbol
      Procession.symbol
    end

    def time
      return '' if @item == 0
      diff_secs = Time.now  - @first_update
      secs_per_item = diff_secs / @item

      remaining_secs = (self.max - @item) * secs_per_item

      secs = (remaining_secs % 60).to_i
      mins = ((remaining_secs / 60) % 60).to_i
      hours = ((remaining_secs / 360) % 24).to_i

      "#{"%02d" % hours}:#{"%02d" % mins}:#{"%02d" % secs}"
    end
  end
end
