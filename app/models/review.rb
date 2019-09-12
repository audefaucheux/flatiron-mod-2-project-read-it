class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def username
    self.user.username
  end

end
