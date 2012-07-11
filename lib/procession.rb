require "procession/version"
require 'procession/bar'

module Procession
  def self.symbol
    @@symbol ||= '#'
  end

  def self.symbol=(value)
    @@symbol = value
  end

  def self.template
    @@template ||= nil
  end

  def self.template=(template)
    @@template = template
  end

  def self.length
    @@length ||= nil
  end

  def self.length=(length)
    @@length = length
  end
end
