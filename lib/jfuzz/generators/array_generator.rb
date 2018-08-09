# frozen_string_literal: true

require "jfuzz/generators/generator"

module Jfuzz
  class ArrayGenerator < Generator
    def generate
      true
    end

    def self.type
      "array"
    end
  end
end
