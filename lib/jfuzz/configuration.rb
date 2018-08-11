# frozen_string_literal: true

require "jfuzz/version"

module Jfuzz
  class Configuration
    def initialize
      @generators = {}
      @nil_probability = 0
      @true_probability = 0
      @min_integer = 0
      @max_integer = 0
    end

    attr_reader :generators

    attr_accessor :nil_probability,
                  :true_probability,
                  :min_integer,
                  :max_integer
  end
end
