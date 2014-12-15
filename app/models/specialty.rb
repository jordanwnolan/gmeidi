require_relative '../../config/constants'

class Specialty
  attr_reader :short_name, :description, :payout_level
  def initialize(params)
    @short_name = params[:short_name]
    @description = params[:description]
    @payout_level = params[:payout_level]
  end

  def to_json
    {
      short_name: @short_name,
      description: @description
    }.to_json
  end
end