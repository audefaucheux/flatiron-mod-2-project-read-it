class User < ApplicationRecord
    has_secure_password

    has_one :reading_list
    has_many :reviews
    has_many :books, through: :reading_list

    validates :email_address, presence: true
    validates :email_address, uniqueness: true

end
