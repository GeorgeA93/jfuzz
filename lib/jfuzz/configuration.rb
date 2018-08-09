# frozen_string_literal: true

require "jfuzz/version"

module Jfuzz
  class Configuration
    def initialize
      @generators = {}
      @nil_probability = 0
    end

    attr_reader :generators

    attr_accessor :nil_probability
  end
end
