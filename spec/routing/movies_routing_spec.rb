# This file contains tests for movies routing

require 'spec_helper'

describe "routing to movies" do
  it "routes /movies/director/1 to movies#director for id 1" do
    { :get => "/movies/director/1" }.should route_to(:controller => "movies", :action => "director", :id => "1")
  end
end

