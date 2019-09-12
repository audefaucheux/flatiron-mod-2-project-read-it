class User < ApplicationRecord
    has_secure_password

    has_many :reading_lists
    has_many :reviews
    has_many :books, through: :reading_lists

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email_address, presence: true
    validates :email_address, uniqueness: true
    validates :password, presence: true

    def total_books
        self.books.count
    end

    def book_exist(title, author)
        self.books.find do |book|
            book.title == title && book.author.name == author
        end
    end
end
