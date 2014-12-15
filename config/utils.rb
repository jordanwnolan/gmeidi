require_relative 'constants'

module Utils
  def self.get_age(age)
    age.to_i - Constants::QUOTES_OFFSET
  end

  def self.get_level(level)
    level.to_i - Constants::PROFESSION_LEVEL_OFFSET
  end
end