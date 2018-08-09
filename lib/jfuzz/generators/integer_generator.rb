# frozen_string_literal: true

require "jfuzz/generators/generator"

module Jfuzz
  class IntegerGenerator < Generator
    def generate
      true
    end

    def self.type
      "integer"
    end
  end
end
