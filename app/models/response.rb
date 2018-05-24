class Response < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :thread, class_name: 'Thre', optional: true
end
