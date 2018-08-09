# frozen_string_literal: true

require "regexp-examples"
require "jfuzz/generators/generator"

module Jfuzz 
  class StringGenerator < Generator

    DATE_REGEXP = /\A\d{4}-\d{2}-\d{2}\z/
    TIME_REGEXP = /\A(\d{2}):(\d{2}):(\d{2})\z/
    DATE_TIME_REGEXP = /\A\d{4}-\d{2}-\d{2}T(\d{2}):(\d{2}):(\d{2})([\.,]\d+)?(Z|[+-](\d{2})(:?\d{2})?)?\z/

    DATE = "date"
    TIME = "time"
    DATE_TIME = "date-time"

    FORMATS = {
      DATE => DATE_REGEXP,
      TIME => TIME_REGEXP,
      DATE_TIME => DATE_TIME_REGEXP,
    }.freeze

    CHARSET = Array('A'..'Z') + Array('a'..'z') + Array(0..9)

    def generate
      return generate_string unless regex?

      generate_from_regex
    end

    def self.type
      "string"
    end

    private

    def generate_string
      length = rand(min_length..max_length)
      Array.new(length) { CHARSET.sample }.join
    end

    def generate_from_regex
      if format.to_s.empty?
        return Regexp.new(pattern).random_example
      end

      FORMATS[format].random_example
    end

    def max_length
      property.fetch("maxLength", rand(min_length..100))
    end

    def min_length
      property.fetch("minLength", 1)
    end

    def regex?
      !pattern.nil? || !format.nil?
    end

    def pattern
      property.fetch("pattern", nil)
    end

    def format
      property.fetch("format", nil)
    end
  end
end
