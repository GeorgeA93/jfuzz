# frozen_string_literal: true

module FixtureHelper
  def fixture_path(*path)
    File.join(File.dirname(__FILE__), "..", "fixtures", *path)
  end

  def load_fixture(*path)
    File.read(fixture_path(*path), external_encoding: Encoding::UTF_8)
  end
end
