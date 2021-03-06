require 'pushpop'
require 'httparty'

require 'dotenv'
Dotenv.load

job do
  every 5.minute

  step 'ping instance' do
    if ENV['APP_NAME']
      app_name = ENV['APP_NAME']

      if ENV['HTTP_USERNAME']
        app_name = "#{ENV['HTTP_USERNAME']}:#{ENV['HTTP_PASSWORD']}@#{app_name}"
      end

      url = "https://#{app_name}.herokuapp.com"
      HTTParty.get(url)
    end
  end
end
