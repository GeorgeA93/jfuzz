# frozen_string_literal: true

module Jfuzz
  class PropertyFuzzer
    def fuzz_property(property, required_keys)
      type = type(property)
      required = property_required?(property, required_keys)

      generator = Jfuzz.generators.fetch(type, nil)
      if generator.nil?
        # raise "No generator for type #{type}"
        return
      end
      
      generator.new(property, required, self).try_generate
    end

    private

    def type(property)
      t = property["type"]

      if t.nil?
        # Try figure out enums here?
      end
      t
    end

    def property_required?(property, required_keys)
      required_keys.include?(property)
    end
  end
end
