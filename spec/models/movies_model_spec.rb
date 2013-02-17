# This file contains tests for movies model

require 'spec_helper'

describe Movie do
  describe "Movies Model" do
    it "Find movies with same director" do
      movie1 = Movie.create!(:director => "Director 1")
      movie2 = Movie.create!(:director => "Director 2")
      movie3 = Movie.create!(:director => "Director 1")

      movies = Movie.where("director = ?", movie1.director)

      movies.should eq([movie1, movie3])
    end
  end
end

