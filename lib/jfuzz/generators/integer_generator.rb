# frozen_string_literal: true

require "bigdecimal"
require "jfuzz/generators/generator"

module Jfuzz
  class IntegerGenerator < Generator
    def generate
      random_integer
    end
    
    def self.type
      "integer"
    end

    private

    def random_integer
      min = minimum
      max = maximum
      if exclusive_minimum?
        min + 1
      end
      if exclusive_maximum?
        max - 1
      end

      return generate_multiple(min, max) if multiple_of?

      rand(min..max)
    end

    def generate_multiple(min, max)
      factor = property.fetch("multipleOf").to_i

      min = min / factor
      max = max / factor
      rand(min..max).to_i * factor
    end

    def minimum
      if minimum?
        return property.fetch("minimum").to_i
      end
      Jfuzz.min_integer.to_i
    end

    def maximum
      if maximum?
        return property.fetch("maximum").to_i
      end
      Jfuzz.max_integer.to_i
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
