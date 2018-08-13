# frozen_string_literal: true

require "regexp-examples"
require "date"
require "jfuzz/generators/generator"

module Jfuzz
  class StringGenerator < Generator
    DATE = "date"
    TIME = "time"
    DATE_TIME = "date-time"

    CHARSET = Array("A".."Z") + Array("a".."z") + Array(0..9)

    def generate
      if format?
        return generate_from_format
      elsif pattern?
        return generate_from_pattern
      end

      generate_string
    end

    def self.type
      "string"
    end

    private

    def generate_string
      length = rand(min_length..max_length)
      Array.new(length) { CHARSET.sample }.join
    end

    # rubocop:disable Metrics/AbcSize
    def generate_from_format
      str = case format
            when DATE
              Time.at(rand * Time.now.to_i).to_date.to_s
            when TIME
              Time.at(rand * Time.now.to_i).to_datetime.to_s
            when DATE_TIME
              Time.at(rand * Time.now.to_i).to_s
            else
              raise "Unsupported format: #{format}"
            end

      return str[0..max_length - 1] if max_length?
      str
    end
    # rubocop:enable Metrics/AbcSize

    def generate_from_pattern
      str = Regexp.new(pattern).random_example

      return str[0..max_length - 1] if max_length?
      str
    end

    def max_length
      property.fetch("maxLength", rand(min_length..100)).to_i
    end

    def min_length
      property.fetch("minLength", 1).to_i
    end

    def pattern?
      !pattern.nil?
    end

    def format?
      !format.nil?
    end

    def max_length?
      !property.fetch("maxLength", nil).to_s.empty?
    end

    def pattern
      property.fetch("pattern", nil)
    end

    def format
      property.fetch("format", nil)
    end
  end
end
