# frozen_string_literal: true

require "jfuzz/generators/generator"

module Jfuzz
  class ObjectGenerator < Generator
    def generate
      result = {}
      required_keys = property.fetch("required", [])
      property["properties"].each do |key, value|
        result[key] = property_fuzzer.fuzz_property(value, required_keys)
      end
      result
    end

    def self.type
      "object"
    end
  end
end
