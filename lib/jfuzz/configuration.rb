# frozen_string_literal: true

require "jfuzz/version"

module Jfuzz
  class Configuration
    def initialize
      @generators = {}
    end

    attr_reader :generators
  end
end
