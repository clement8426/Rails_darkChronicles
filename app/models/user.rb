class User < ApplicationRecord
  self.inheritance_column = nil
  belongs_to :group, class_name: 'Group', foreign_key: 'group_id', optional: true
  has_many :sheets
  has_many :npcs


  # include PgSearch::Model
  # pg_search_scope :search_by_name,
  #   against: [ :name ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
