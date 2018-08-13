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
      raise "Schema path cannot be nil or empty" if schema_path.to_s.nil?

      schema_contents = File.read(schema_path)
      schema = JSON.parse(schema_contents)

      property_fuzzer.fuzz_property(schema)
    end

    private

    attr_reader :schema_path, :property_fuzzer
  end
end
