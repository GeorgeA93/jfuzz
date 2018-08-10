# frozen_string_literal: true

require "jfuzz/generators/generator"

module Jfuzz
  class EnumGenerator < Generator
    def generate
      pick_value
    end

    def self.type
      "enum"
    end

    private

    def pick_value
      max = enum_types.length - 1
      enum_types[rand(0..max)]
    end

    def enum_types
      property.fetch("enum", [])
    end
  end
end
