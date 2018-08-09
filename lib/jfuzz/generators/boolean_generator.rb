# frozen_string_literal: true

require "jfuzz/generators/generator"

module Jfuzz
  class BooleanGenerator < Generator
    def generate
      if rand < Jfuzz.true_probability
        return true
      end
      false
    end

    def self.type
      "boolean"
    end
  end
end
