require "procession/version"
require 'procession/bar'

module Procession
  def self.symbol
    @@symbol ||= '#'
  end

  def self.symbol=(value)
    @@symbol = value
  end
end
