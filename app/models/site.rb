class Site < ApplicationRecord
  validates :key, presence: true

  has_many :pages

  def to_s
    key
  end
end
