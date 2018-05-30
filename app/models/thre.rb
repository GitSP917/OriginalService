class Thre < ApplicationRecord
  belongs_to :user
  has_many :responses, dependent: :destroy
  
  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 255 }

end
