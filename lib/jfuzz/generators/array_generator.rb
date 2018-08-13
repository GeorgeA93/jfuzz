# frozen_string_literal: true

require "jfuzz/generators/generator"

module Jfuzz
  class ArrayGenerator < Generator
    def generate
      unless items.any?
        raise "Cannot generate an empty array. Please specify item types"
      end

      if items.kind_of?(Array)
        return tuple_array
      end
      random_array
    end

    def self.type
      "array"
    end

    private

    def random_array
      total_items = rand(min_items..max_items)
      (0..total_items).map do
        property_fuzzer.fuzz_property(items)
      end
    end

    def tuple_array
      items.map do |item|
        property_fuzzer.fuzz_property(item)
      end
    end

    def items
      property.fetch("items", [])
    end

    def min_items
      property.fetch("minItems", Jfuzz.min_array_length)
    end

    def max_items
      property.fetch("maxItems", Jfuzz.max_array_length)
    end

    def unique?
      property.fetch("uniqueItems", false)
    end
  end
end
