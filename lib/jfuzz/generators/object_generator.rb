# frozen_string_literal: true

require "jfuzz/generators/generator"

module Jfuzz
  class ObjectGenerator < Generator
    def generate
      result = {}
      required_keys = property.fetch("required", [])
      property["properties"].each do |key, value|
        next if skip?(key, required_keys)

        result[key] = property_fuzzer.fuzz_property(value)
      end
      result
    end

    def self.type
      "object"
    end

    private

    def skip?(key, required_keys)
      return false if required_keys.include?(key)

      rand <= Jfuzz.nil_probability
    end
  end
end
