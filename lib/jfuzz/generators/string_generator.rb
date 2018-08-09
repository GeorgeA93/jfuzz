# frozen_string_literal: true

require "regexp-examples"
require "jfuzz/generators/generator"

module Jfuzz 
  class StringGenerator < Generator
    def generate
      return generate_string if pattern.nil?

      generate_from_regex
    end

    def self.type
      "string"
    end

    private

    def generate_string
      length = rand(min_length..max_length)
      (0...length).map { (65 + rand(26)).chr }.join
    end

    def generate_from_regex
      Regexp.new(pattern).random_example
    end

    def max_length
      property.fetch("maxLength", rand(min_length..100))
    end

    def min_length
      property.fetch("minLength", 1)
    end

    def pattern
      property.fetch("pattern", nil)
    end
  end
end
