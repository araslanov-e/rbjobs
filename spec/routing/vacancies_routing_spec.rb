require 'spec_helper'

describe "routes for Vacancies" do
  it "routes / to the vacancies controller" do
    { :get => "/" }.
      should route_to(:controller => "vacancies", :action => "index")
  end
  
  it "routes /vacancies to the vacancies controller" do
    { :get => "/vacancies" }.
      should route_to(:controller => "vacancies", :action => "index")
  end

  it "routes /vacancies/new to the :new action of vacancies controller" do
    { :get => "/vacancies/new" }.
      should route_to(:controller => "vacancies", :action => "new")
  end

  it "routes /vacancies/123 to the :show action of vacancies controller" do
    { :get => "/vacancies/123" }.
      should route_to(:controller => "vacancies", :action => "show", :id => "123")
  end
end