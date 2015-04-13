require 'sinatra'
require 'action_mailer'

class Mailer < ActionMailer::Base
  def application app_data
    @app = app_data
    p @app
    mail(
      :to      => "maxwell@di-ltc.com,patrick@di-ltc.com",
      :from    => "gmeidiapp@gmail.com",
      :subject => "New Application Request") do |format|
        format.html
    end
  end
end