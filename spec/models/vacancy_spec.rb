require 'spec_helper'

describe Vacancy do
  subject do
    stub_model(Vacancy, {
      :title       => "Foo",
      :description => "Lorem ipsum",
      :company     => "Foo Inc.",
      :email       => "person@example.com",
      :expire_at   => 1.week.from_now
    }).as_new_record
  end
  
  it "isn't valid without title" do
    subject.title = nil
    subject.should_not be_valid
  end

  it "isn't valid without description" do
    subject.description = nil
    should_not be_valid
  end

  it "isn't valid without email" do
    subject.email = nil
    should_not be_valid
  end

  it "isn't valid with email in wrong format" do
    subject.email = "wrong@email"
    should_not be_valid
  end

  it "isn't valid without expiration date" do
    subject.expire_at = nil
    subject.should_not be_valid
  end

  context "after creating a new record" do
    it "assigns owner token" do
      subject.owner_token = nil
      subject.save!
      subject.owner_token.should_not be_blank
    end
    it "assigns admin token" do
      subject.admin_token = nil
      subject.save!
      subject.admin_token.should_not be_blank
    end
  end
  
  context "after saving the vacancy" do
    it "assigns vacancy's excerpt" do
      subject.excerpt_html = nil
      subject.save!
      subject.excerpt_html.should_not be_blank
    end
    it "assigns vacancy's description as html" do
      subject.description_html = nil
      subject.save!
      subject.description_html.should_not be_blank
    end
  end

  describe "#approved?" do
    context "when vacancy has approving mark" do
      before{ subject.approved_at = Date.current }
      
      it "should return true" do
        subject.should be_approved
      end
    end
    context "when vacancy doesn't have approving mark" do
      before{ subject.approved_at = nil }
      
      it "should return false" do
        subject.should_not be_approved
      end
    end
  end
end
