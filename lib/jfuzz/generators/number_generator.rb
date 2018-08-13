# frozen_string_literal: true

require "bigdecimal"
require "jfuzz/generators/generator"

module Jfuzz
  class NumberGenerator < Generator
    def generate
      random_number
    end

    def self.type
      "number"
    end

    private

    def random_number
      min = minimum
      max = maximum
      min + 0.1 if exclusive_minimum?
      max - 0.1 if exclusive_maximum?

      return generate_multiple(min, max) if multiple_of?

      rand(min..max)
    end

    def generate_multiple(min, max)
      factor = property.fetch("multipleOf").to_f

      min /= factor
      max /= factor
      rand(min..max).to_i * factor
    end

    def minimum
      return property.fetch("minimum").to_f if minimum?
      Jfuzz.min_integer.to_f
    end

    def maximum
      return property.fetch("maximum").to_f if maximum?
      Jfuzz.max_integer.to_f
    end

    def multiple_of?
      property.key?("multipleOf")
    end

    def minimum?
      property.key?("minimum")
    end

    def maximum?
      property.key?("maximum")
    end

    def exclusive_maximum?
      property.fetch("exclusiveMaximum", false)
    end

    def exclusive_minimum?
      property.fetch("exclusiveMinimum", false)
    end
  end
end
