require_relative '../config/constants'
require_relative '../app'
require_relative '../app/models/specialty'
require_relative '../app/models/quote'
require_relative '../app/models/mailer'
require_relative '../app/models/application_request'
require 'json'

module Sinatra
  module GMEIDI
    module Routing
      def self.registered(app)

        app.get '/' do
          specialties = Constants::SPECIALTIES.map do |specialty|
            Specialty.new(specialty)
          end
          haml :homepage, locals: { specialties: specialties }
        end

        app.get '/specialties' do
          json Constants::SPECIALTIES
        end

        app.post '/quotes' do
          specialty = Constants::SPECIALTIES.select do |sp|
            sp[:short_name] == params[:application][:specialty]
          end.first

          params[:application][:level] = Specialty.new(specialty).payout_level
          quote = Quote.new(params[:application])
          p quote
          json quote.to_json
        end

        app.post '/request_application' do
          specialty = Constants::SPECIALTIES.select do |sp|
            sp[:short_name] == params[:application][:specialty]
          end.first

          quote = Quote.new(params[:application])
          params[:application][:education_level] = Constants::EDUCATION_LEVELS[params[:application][:level].to_sym]
          params[:application][:level] = Specialty.new(specialty).payout_level
          params[:application][:quote] = quote
          params[:application][:specialty] = specialty[:description]
          params[:application][:school] = Constants::SCHOOLS[params[:application][:school].to_sym]
          email = Mailer.application ApplicationRequest.new(params[:application])
          email.deliver
          200
        end
      end
    end
  end
end