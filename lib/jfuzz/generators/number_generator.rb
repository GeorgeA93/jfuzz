# frozen_string_literal: true

require "jfuzz/generators/generator"

module Jfuzz
  class NumberGenerator < Generator
    def generate
      true
    end
    
    def self.type
      "number"
    end
  end
end
