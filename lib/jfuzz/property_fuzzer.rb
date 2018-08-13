# frozen_string_literal: true

module Jfuzz
  class PropertyFuzzer
    def fuzz_property(property)
      type = type(property)

      generator = Jfuzz.generators.fetch(type, nil)
      raise "No generator for type #{type}" if generator.nil?

      generator.new(property, self).try_generate
    end

    private

    def type(property)
      t = property["type"]

      t = "enum" if enum?(property)
      t
    end

    def enum?(property)
      property.fetch("enum", []).any?
    end
  end
end
