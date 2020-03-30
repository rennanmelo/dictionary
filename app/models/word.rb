class Word < ApplicationRecord
  validates :name, :meaning, :example, presence: true
  validates :name, :uniqueness => { :case_sensitive => false }

  extend FriendlyId
  friendly_id :name, use: :slugged
end