# frozen_string_literal: true

module Jfuzz
  class PropertyFuzzer
    def fuzz_property(property)
      type = type(property)

      generator = Jfuzz.generators.fetch(type, nil)
      if generator.nil?
        raise "No generator for type #{type}"
      end
      
      generator.new(property, self).try_generate
    end

    private

    def type(property)
      t = property["type"]

      if t.nil? && enum?(property)
        t = "enum"
      end
      t
    end

    def enum?(property)
      property.fetch("enum", []).any?
    end
  end
end
