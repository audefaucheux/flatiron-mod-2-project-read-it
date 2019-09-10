class User < ApplicationRecord
    has_secure_password

    has_many :reading_lists
    has_many :reviews
    has_many :books, through: :reading_lists

    validates :email_address, presence: true
    validates :email_address, uniqueness: true
    validates :password, presence: true

    def total_books
        self.books.count
    end
end
