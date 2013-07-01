require 'rubygems'

# Setup our coverage reporting first before anything else is loaded
require 'simplecov'
require 'simplecov-html'
require 'simplecov-rcov'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::RcovFormatter,
]
SimpleCov.start 'rails'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
# Require Factory Girl and load factories
require 'factory_girl'
# Require our Database Cleaner to clean up after ourselves
require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
# Require draper helpers
require 'draper/test/rspec_integration'
RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # We are not using fixtures so comment this out
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # We are not using fixtures so comment this out
  # config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Allow us to use simple filters like :focus
  config.treat_symbols_as_metadata_keys_with_true_values = true
  # If everything is filtered out we'll run everything
  config.run_all_when_everything_filtered = true
  # We'll use :focus to specify which tests to run
  config.filter_run :focus
  # Optionally use a tag to filter out tests
  # config.filter_run_excluding :slow

  # Factory Girl setup
  config.include FactoryGirl::Syntax::Methods

  config.before(:each) do
    if [:request, :feature].include? example.metadata[:type]
      Capybara.current_driver = :poltergeist
    else
      Capybara.use_default_driver
    end
  end

  # Since we are using factories we must clean up
  config.after(:each) do
    DatabaseCleaner.clean
  end

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end
