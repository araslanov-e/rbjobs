require 'spec_helper'

describe VacanciesController do
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    let(:vacancy){ stub_model(Vacancy) }
    
    before do
      Vacancy.stub(:find).and_return(vacancy)
    end
    
    it "should be successful" do
      get 'show', :id => vacancy.id
      response.should be_success
    end
  end
end
