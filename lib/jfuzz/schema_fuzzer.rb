# frozen_string_literal: true

require "json"
require "json_schema"
require "jfuzz/property_fuzzer"

module Jfuzz
  class SchemaFuzzer
    def initialize(schema_path)
      @schema_path = schema_path
      @property_fuzzer = PropertyFuzzer.new
    end

    def fuzz
      raise "Schema path cannot be nil or empty" if schema_path.to_s.nil?

      schema_contents = File.read(schema_path)
      schema = JSON.parse(schema_contents)

      fuzzed = property_fuzzer.fuzz_property(schema)

      json_schema = JsonSchema.parse!(schema)
      is_valid, validation_errors = json_schema.validate(fuzzed)

      unless is_valid
        raise "Error in the report validation. Produced invalid JSON file " \
          "according to JSON schema #{schema_path}. " \
          "Validation errors: #{validation_errors}"
      end

      fuzzed
    end

    private

    attr_reader :schema_path, :property_fuzzer
  end
end
