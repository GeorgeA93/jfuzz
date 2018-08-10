# frozen_string_literal: true

module Jfuzz
  class Generator
    def initialize(property, property_fuzzer)
      @property = property
      @property_fuzzer = property_fuzzer
    end

    def try_generate
      generate
    end

    def self.type
      raise "`type` must be implemented by sub class"
    end

    private

    def generate
      raise "`generate` must be implemented by sub class"
    end

    attr_reader :property, :property_fuzzer
  end
end
