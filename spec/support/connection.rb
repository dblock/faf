RSpec.configure do |config|
  config.before do
    Faf::Connection.initialize!(ENV['GITHUB_ACCESS_TOKEN'] || 'access-token')
  end
  config.after do
    Faf::Connection.reset!
  end
end
