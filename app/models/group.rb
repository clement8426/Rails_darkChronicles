# app/models/group.rb

class Group < ApplicationRecord
  belongs_to :maitre_de_jeu, class_name: 'User', foreign_key: 'user_id'
  has_many :joueurs, class_name: 'User', foreign_key: 'group_id'

  validates :name, presence: true

end
