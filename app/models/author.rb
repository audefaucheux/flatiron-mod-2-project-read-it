class Author < ApplicationRecord
    has_many :books
    has_many :genres, through: :books

    def unique_genre_name
        self.genres.map do |genre|
            genre.name
        end.uniq
    end

end
