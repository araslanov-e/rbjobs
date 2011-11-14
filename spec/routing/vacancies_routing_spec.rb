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

  it "routes /vacancies to the :create action of vacancies controller" do
    { :post => "/vacancies" }.
      should route_to(:controller => "vacancies", :action => "create")
  end

  it "routes /vacancies/123 to the :show action of vacancies controller" do
    { :get => "/vacancies/123" }.
      should route_to(:controller => "vacancies", :action => "show", :id => "123")
  end

  it "routes /vacancies/123/edit to the :edit action of vacancies controller" do
    { :get => "/vacancies/123/edit" }.
      should route_to(:controller => "vacancies", :action => "edit", :id => "123")
  end

  it "routes /vacancies/123 to the :update action of vacancies controller" do
    { :put => "/vacancies/123" }.
      should route_to(:controller => "vacancies", :action => "update", :id => "123")
  end

  it "routes /vacancies/123 to the :destroy action of vacancies controller" do
    { :delete => "/vacancies/123" }.
      should route_to(:controller => "vacancies", :action => "destroy", :id => "123")
  end

  it "routes /vacancies/123/approve to the :approve action of vacancies controller" do
    { :put => "/vacancies/123/approve" }.
      should route_to(:controller => "vacancies", :action => "approve", :id => "123")
  end
end