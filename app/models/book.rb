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
    if self.reviews.size == 0
      "No ratings yet"
    else
      total_rating = self.reviews.map{|review| review.rating}
      average = total_rating.inject{|sum, el| sum + el}.to_f/total_rating.size
      "User rating: #{average.to_i}/5"
    end
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
