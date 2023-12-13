class Group < ApplicationRecord
  belongs_to :user
  has_many :users, class_name: 'User', foreign_key: 'group_id'

end
