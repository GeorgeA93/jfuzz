# frozen_string_literal: true

require 'active_support/core_ext/module/delegation'

require "jfuzz/version"
require "jfuzz/configuration"
require "jfuzz/schema_fuzzer"
require "jfuzz/generators/boolean_generator"
require "jfuzz/generators/integer_generator"
require "jfuzz/generators/number_generator"
require "jfuzz/generators/enum_generator"
require "jfuzz/generators/object_generator"
require "jfuzz/generators/array_generator"
require "jfuzz/generators/string_generator"


module Jfuzz
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.fuzz(schema_path)
   SchemaFuzzer.new(schema_path).fuzz
  end

  class << self
    delegate :generators,
             :nil_probability,
             :true_probability,
             to: :configuration
  end

  def self.register_generator(generator_klass)
    type = generator_klass.type
    generators[type] = generator_klass
  end

  def self.set_nil_probability(val)
    configuration.nil_probability = val
  end

  def self.set_true_probability(val)
    configuration.true_probability = val
  end
  
  def self.set_min_integer(val)
    configuration.min_integer = val
  end

  def self.set_max_integer(val)
    configuration.max_integer = val
  end

  def self.register_default_generators
    register_generator(BooleanGenerator)
    register_generator(IntegerGenerator)
    register_generator(NumberGenerator)
    register_generator(EnumGenerator)
    register_generator(ObjectGenerator)
    register_generator(ArrayGenerator)
    register_generator(StringGenerator)
  end

  def self.set_defaults
    set_nil_probability(0.2)
    set_true_probability(0.5)
    set_min_integer(-9999999)
    set_max_integer(9999999)

    register_default_generators
  end
end

Jfuzz.set_defaults
