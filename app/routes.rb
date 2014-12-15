require_relative '../config/constants'
require_relative '../app'
require_relative '../app/models/specialty'
require_relative '../app/models/quote'
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
      end
    end
  end
end