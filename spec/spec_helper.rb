# frozen_string_literal: true

require "bundler/setup"
require "jfuzz"
require "support/fixture_helper"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"
  config.include FixtureHelper
  config.order = "random"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
