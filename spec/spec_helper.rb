require "shoulda-matchers"
require "sunspot/rails/spec_helper"
require "bundler/setup"
::Bundler.require(:default, :test)

::Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :active_record
    with.library :active_model
  end
end
