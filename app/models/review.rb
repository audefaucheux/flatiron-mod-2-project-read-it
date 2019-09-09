class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def user_email_address
    self.user.email_address
  end

end
