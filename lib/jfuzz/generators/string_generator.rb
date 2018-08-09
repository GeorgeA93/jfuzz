# frozen_string_literal: true

require "jfuzz/generators/generator"

module Jfuzz 
  class StringGenerator < Generator
    def generate
      ""
    end

    def self.type
      "string"
    end
  end
end
