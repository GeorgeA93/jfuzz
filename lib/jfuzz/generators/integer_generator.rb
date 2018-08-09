# frozen_string_literal: true

require "jfuzz/generators/generator"

module Jfuzz
  class IntegerGenerator < Generator
    def generate
      0
    end

    def self.type
      "integer"
    end
  end
end
