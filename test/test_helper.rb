ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/reporters"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Format test results nicely
  Minitest::Reporters.use!

  # Add more helper methods to be used by all tests here...
  include ApplicationHelper
  include Devise::Test::IntegrationHelpers
end
