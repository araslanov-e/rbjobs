require 'spec_helper'

describe VacanciesHelper do
  let(:vacancy){ stub_model(Vacancy, :company => "Foo Inc.", :location => "Neverland") }
  
  describe "company_location_tag" do
    context "when company and location are presented" do
      it "concats company and location with dash" do
        helper.company_location_tag(vacancy).should == "#{vacancy.company} - #{vacancy.location}"
      end
    end
    context "when company is blank" do
      before{ vacancy.company = nil }
      
      it "returns only location string" do
        helper.company_location_tag(vacancy).should == vacancy.location
      end
    end
    context "when location is blank" do
      before{ vacancy.location = nil }
      
      it "returns only company string" do
        helper.company_location_tag(vacancy).should == vacancy.company
      end
    end
    context "when company and location are blank" do
      before do
        vacancy.company = nil
        vacancy.location = nil
      end
      
      it "returns empty string" do
        helper.company_location_tag(vacancy).should be_blank
      end
    end
  end
end
