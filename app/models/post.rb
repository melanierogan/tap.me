class Post < ApplicationRecord
  belongs_to :user
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  validates :body, presence: true,
                    length: { minimum: 3, maximum: 300 }
  validates :user_id, presence: true

end
