Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'blockstarter.example.com' # Replace 'blockstarter.example.com' with the actual domain of the frontend application
    resource '*',
      headers: :any,
      methods: [:get, :post, :patch, :put, :delete, :options, :head],
      expose: ['Authorization']
  end
end