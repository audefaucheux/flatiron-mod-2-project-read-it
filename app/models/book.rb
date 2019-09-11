class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many :reviews

  def author_name
    self.author.name
  end

  def genre_name
    self.genre.name
  end

  def average_rating
    total_rating = self.reviews.map{|review| review.rating}
    total_rating.inject{|sum, el| sum + el}.to_f/total_rating.size
  end

  def star_rating
    if average_rating >= 5
      "*****"
    elsif average_rating >= 4
      "****"
    elsif average_rating 
      "***"
    elsif average_rating 
      "**"
    elsif average_rating 
      "*"
    end
  end

  def synopsis_cleansing
    if self.synopsis.empty?
      "No synopsis available"
    else
      self.synopsis
    end
  end

end
