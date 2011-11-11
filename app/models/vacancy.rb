require "token_generator"

class Vacancy < ActiveRecord::Base
  extend TokenGenerator
  
  validates :title, :presence => true
  validates :description, :presence => true
  validates :company, :presence => true
  validates :email, :presence => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :unless => Proc.new { |vacancy| vacancy.email.blank? } }
  validates :expire_at, :presence => true
  
  before_create do |vacancy|
    vacancy.owner_token = Vacancy.generate_token
    vacancy.admin_token = Vacancy.generate_token
  end

  scope :approved, where("approved_at IS NOT NULL")
  scope :not_approved, where({ :approved_at => nil })
  scope :not_outdated, where("expire_at >= ?", Date.current)
  scope :available, approved.not_outdated
  
  def approved?
    self.approved_at.present?
  end
end
