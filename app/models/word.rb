class Word < ApplicationRecord
  validates :name, :meaning, :example, presence: true
  validates :name, uniqueness: true

  extend FriendlyId
  friendly_id :name, use: :slugged
end