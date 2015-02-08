require './app'
require 'sprockets'

map '/public' do
  environment = Sprockets::Environment.new
  environment.append_path 'public/javascripts'
  environment.append_path 'public/stylesheets'
  run environment
end

map '/' do
  run GMEIDIApplication
end

  configure do
    set :root,    File.dirname(__FILE__)
    set :views,   File.join(Sinatra::Application.root, 'views')
    set :haml,    { :format => :html5 }

    if production?
      ActionMailer::Base.smtp_settings = {
        :address => "smtp.sendgrid.net",
        :port => '25',
        :authentication => :plain,
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD']
      }
      ActionMailer::Base.view_paths = File.join(Sinatra::Application.root, 'views')
    else
      ActionMailer::Base.delivery_method = :file
      ActionMailer::Base.file_settings = { :location => File.join(Sinatra::Application.root, 'tmp/emails') }
      ActionMailer::Base.view_paths = File.join(Sinatra::Application.root, 'views')
    end
  end