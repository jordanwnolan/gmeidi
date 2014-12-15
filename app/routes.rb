require_relative '../config/constants'
require_relative '../app'
require 'json'

module Sinatra
  module GMEIDI
    module Routing
      def self.registered(app)

        app.get '/' do
          haml :homepage, locals: { specialties: Constants::SPECIALTIES }
        end

        app.get '/specialties' do
          json Constants::SPECIALTIES
        end

        app.post '/applications' do

        end
      end
    end
  end
end