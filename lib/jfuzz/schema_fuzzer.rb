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
      schema_contents = File.read(schema_path)
      schema = JSON.parse(schema_contents)

      result = {}
      schema["properties"].each do |key, property|
        result[key] = property_fuzzer.fuzz_property(property)
      end
      result
    end

    private

    attr_reader :schema_path, :property_fuzzer

  end
end
