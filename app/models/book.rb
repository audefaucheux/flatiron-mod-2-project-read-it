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

end
