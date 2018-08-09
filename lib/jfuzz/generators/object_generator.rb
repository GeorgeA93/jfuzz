# frozen_string_literal: true

require "jfuzz/generators/generator"

module Jfuzz
  class ObjectGenerator < Generator
    def generate
      true
    end

    def self.type
      "object"
    end
  end
end
