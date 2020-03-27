class Word < ApplicationRecord
  validates :name, :meaning, :example, presence: true
  validates :name, uniqueness: true
end
