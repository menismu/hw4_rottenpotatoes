# This file contains tests for movies controller

require 'spec_helper'

describe MoviesController do
  describe "GET /movies/director/1" do
    before(:each) do
      @movie1 = stub_model(Movie)
      @movie1.director = "Director 1"
      @movie2 = stub_model(Movie)
      @movie2.director = ""
      @movie3 = stub_model(Movie)
      @movie3.director = "Director 1"
    end

    it "Find movies with same director" do
      Movie.stub(:find) { @movie1 }
      Movie.stub(:where) { [@movie1, @movie3] }

      get :director, :id => @movie1.id.to_s
      assigns(:movies).should eq([@movie1, @movie3])
    end

    it "Selected Movie without Director" do
      Movie.stub(:find) { @movie2 }
      Movie.stub(:find_all_by_rating) { [@movie1, @movie2, @movie3] }

      get :director, :id => @movie2.id.to_s
      assigns(:movies).should redirect_to('/movies')
    end
  end
end

