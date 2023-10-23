class Url < ApplicationRecord
  validates :original_link, presence: true

  def get_short_url
    "http://localhost:3000/#{token}"
  end
end
