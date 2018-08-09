# frozen_string_literal: true

require "jfuzz/generators/generator"

module Jfuzz
  class BooleanGenerator < Generator
    def generate
      true
    end

    def self.type
      "boolean"
    end
  end
end
