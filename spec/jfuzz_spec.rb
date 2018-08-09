# frozen_string_literal: true

require "spec_helper"

RSpec.describe Jfuzz do
  describe ".fuzz" do
    subject(:fuzz) { described_class.fuzz(schema_path) }

    let(:schema_path) { fixture_path("schema.json") }

    it "does a thing" do
      res = fuzz
      require "pry"; binding.pry
      expect(1).to eq(1)
    end
  end

  it "has a version number" do
    expect(Jfuzz::VERSION).to_not be nil
  end
end
