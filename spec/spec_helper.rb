module SpecTestHelper
  def sign_in(email, password)
    post '/sessions', params: {email: email, password: password}
  end
end
RSpec.configure do |config|
  config.include SpecTestHelper, :type => :request
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
