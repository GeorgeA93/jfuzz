# frozen_string_literal: true

module Jfuzz
  class Generator
    def initialize(property)
      @property = property
    end

    def generate
      raise "`generate` must be implemented by sub class"
    end

    def self.type
      raise "`type` must be implemented by sub class"
    end

    private

    attr_reader :property
  end
end
