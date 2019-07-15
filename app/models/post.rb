class Post < ApplicationRecord
  belongs_to :user
  # geocoded_by :ip
  # after_validation :geocode



end
