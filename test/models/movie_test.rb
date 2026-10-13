require "test_helper"

class MovieTest < ActiveSupport::TestCase
  test "precisa ter título" do
    movie = Movie.new(rating: "PG", release_date: Date.current)

    assert_not movie.valid?
    assert_includes movie.errors[:title], "can't be blank"
  end

  test "precisa ter data de lançamento" do
    movie = Movie.new(title: "Movie Title", rating: "PG")

    assert_not movie.valid?
    assert_includes movie.errors[:release_date], "can't be blank"
  end

  test "Erro Rating inválido" do
    movie = Movie.new(title: "Movie Title", rating: "Invalid Rating", release_date: Date.current)

    assert_not movie.valid?
    assert_includes movie.errors[:rating], "is not included in the list"
  end
end
