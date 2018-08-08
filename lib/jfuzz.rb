require "jfuzz/version"
require "json_schema"

module Jfuzz
  class Integer
    N_BYTES = [42].pack('i').size
    N_BITS = N_BYTES * 16
    MAX = 2 ** (N_BITS - 2) - 1
    MIN = -MAX - 1
  end

  def self.fuzz(schema_path)
    schema_contents = File.read(schema_path)
    schema = JSON.parse(schema_contents)
    Fuzzer.new(schema).fuzz
  end

  class Fuzzer
    def initialize(schema)
      @schema = schema
    end

    def fuzz
      result = {}

      schema["properties"].each do |key, property|
        fuzzed_value = get_random_value(property)
        result[key] = fuzzed_value
      end

      result
    end

    private

    attr_reader :schema

    def get_random_value(property)
      type = property["type"]
      case type
      when "boolean"
        random_boolean
      when "integer"
        random_integer
      when "number"
        random_float
      when "string"
        random_string
      when "array"
        arr = []
        (0..10).each do
          arr << get_random_value(property["items"])
        end
        arr
      when "object"
        obj = {}
        property["properties"].each do |key, nested_prop|
          value = get_random_value(nested_prop)
          obj[key] = value
        end
        obj
      else
        raise "Cannot handle type #{type}"
      end
    end

    def random_integer(lower = Integer::MIN, upper = Integer::MAX)
      rand(lower..upper)
    end

    def random_float(lower = Integer::MIN, upper = Integer::MAX)
      rand(lower.to_f..upper.to_f)
    end

    def random_string(lower = 0, upper = 100)
      (lower...upper).map { (65 + rand(26)).chr }.join
    end

    def random_boolean
      a = rand(0..1)
      if a == 0
        true
      end
      false
    end
  end
end
