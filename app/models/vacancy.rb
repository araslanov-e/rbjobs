require "token_generator"
require "html_generator"

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
  
  before_save do |vacancy|
    vacancy.excerpt_html     = HtmlGenerator.render extract_excerpt(vacancy.description)
    vacancy.description_html = HtmlGenerator.render vacancy.description
  end

  scope :approved, where("approved_at IS NOT NULL")
  scope :not_approved, where({ :approved_at => nil })
  scope :not_outdated, where("expire_at >= ?", Date.current)
  scope :descent_order, order("id DESC")
  scope :available, approved.not_outdated.descent_order
  
  def approved?
    self.approved_at.present?
  end
  
  def approve!
    self.approved_at = Time.now and self.save!
  end
  
  protected
  
  # Take the first to parts of text divided with two new new lines
  def extract_excerpt(text, divider = "\n")
    text.lines(divider).reject(&:blank?).take(2).join(divider)
  end
end
