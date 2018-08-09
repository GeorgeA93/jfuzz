# frozen_string_literal: true

require "jfuzz/generators/generator"

module Jfuzz
  class EnumGenerator < Generator
    def generate
      []
    end

    def self.type
      "enum"
    end
  end
end
