# frozen_string_literal: true

module Jfuzz
  class Generator
    def initialize(property, required)
      @property = property
      @required = required
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

    attr_reader :property

    def return_nil?
      return false if required?

      rand <= Jfuzz.nil_probability
    end

    def required?
      @required
    end
  end
end
