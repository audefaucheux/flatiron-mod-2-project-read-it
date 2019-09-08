class User < ApplicationRecord
    has_many :reading_lists
    has_many :reviews
    has_many :books, through: reading_lists
end
