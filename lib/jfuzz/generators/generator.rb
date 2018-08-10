# frozen_string_literal: true

module Jfuzz
  class Generator
    def initialize(property, required, property_fuzzer)
      @property = property
      @required = required
      @property_fuzzer = property_fuzzer
    end

    def try_generate
      return nil if return_nil?

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

    def return_nil?
      return false if required?

      rand <= Jfuzz.nil_probability
    end

    def required?
      @required
    end
  end
end
