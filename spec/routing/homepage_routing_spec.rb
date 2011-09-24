require 'spec_helper'

describe "routes for Homepage" do
  it "routes / to the homepage controller" do
    { :get => "/" }.
      should route_to(:controller => "homepage", :action => "index")
  end
end