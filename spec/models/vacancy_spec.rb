require 'spec_helper'

describe Vacancy do
  subject { build(:vacancy) }
  
  it "isn't valid without title" do
    subject.title = nil
    subject.should_not be_valid
  end

  it "isn't valid without description" do
    subject.description = nil
    subject.should_not be_valid
  end

  it "isn't valid without email" do
    subject.email = nil
    subject.should_not be_valid
  end

  it "isn't valid with email in wrong format" do
    subject.email = "wrong@email"
    subject.should_not be_valid
  end

  it "isn't valid without expiration date" do
    subject.expire_at = nil
    subject.should_not be_valid
  end

  it "assigns token after creating a new record" do
    subject.token = nil
    subject.save!
    subject.token.should_not be_blank
  end
end
