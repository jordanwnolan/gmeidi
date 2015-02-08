require_relative '../../config/constants'
require_relative '../../config/utils'

class ApplicationRequest
  attr_accessor :email, :specialty, :quote, :school, :age, :education_level, :plan_selected, :plan_price

  def initialize params
    @email = params[:email]
    @specialty = params[:specialty]
    @quote = params[:quote]
    @school = params[:school]
    @age = params[:age]
    @education_level = params[:education_level]
    @plan_selected = params[:plan_selected]
    @plan_price = params[:plan_price]
  end
end