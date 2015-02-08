require 'sinatra'
require 'action_mailer'

class Mailer < ActionMailer::Base
  def application app_data
    @app = app_data
    p @app
    mail(
      :to      => "jordanwn@gmail",
      :from    => "jordanwn@gmail",
      :subject => "Test") do |format|
        format.html
    end
  end
end