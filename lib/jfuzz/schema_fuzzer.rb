# frozen_string_literal: true

require "json"
require "jfuzz/property_fuzzer"

module Jfuzz
  class SchemaFuzzer
    def initialize(schema_path)
      @schema_path = schema_path
      @property_fuzzer = PropertyFuzzer.new
    end

    def fuzz
      if schema_path.to_s.nil?
        raise "Schema path cannot be nil or empty"
      end

      schema_contents = File.read(schema_path)
      schema = JSON.parse(schema_contents)
      required_keys = schema.fetch("required", [])

      result = {}
      schema["properties"].each do |key, property|
        required = property_required?(key, required_keys)
        result[key] = property_fuzzer.fuzz_property(property, required)
      end
      result
    end

    private

    attr_reader :schema_path, :property_fuzzer

    def property_required?(property, required_keys)
      required_keys.include?(property)
    end
  end
end
