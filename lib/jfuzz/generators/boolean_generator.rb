# frozen_string_literal: true

require "jfuzz/generators/generator"

module Jfuzz
  class BooleanGenerator < Generator
    def generate
      return true if rand < Jfuzz.true_probability
      false
    end

    def self.type
      "boolean"
    end
  end
end
