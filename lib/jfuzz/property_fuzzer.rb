# frozen_string_literal: true

module Jfuzz
  class PropertyFuzzer
    def fuzz_property(property)
      type = property["type"]

      generator = Jfuzz.generators.fetch(type, nil)
      if generator.nil?
        # raise "No generator for type #{type}"
        return
      end
      
      generator.new(property).generate
    end

    private

    def type(property)
      t = property["type"]

      if t.nil?
        # Try figure out enums here?
      end
      t
    end
  end
end
