require "token_generator"

class Vacancy < ActiveRecord::Base
  extend TokenGenerator
  
  validates :title, :presence => true
  validates :description, :presence => true
  validates :email, :presence => true
  
  before_create do |vacancy|
    vacancy.token = Vacancy.generate_token
  end
end
