class List < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  validates :name, presence: true, uniqueness: true
  # validates :photo, presence: true
end
