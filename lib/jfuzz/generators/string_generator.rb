# frozen_string_literal: true

require "jfuzz/generators/generator"

module Jfuzz 
  class StringGenerator < Generator
    def generate
      (lower_bound...upper_bound).map { (65 + rand(26)).chr }.join
    end

    def self.type
      "string"
    end

    private

    def upper_bound
      rand(0..100)
    end

    def lower_bound
      0
    end
  end
end
