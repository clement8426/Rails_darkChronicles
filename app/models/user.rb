# app/models/user.rb

class User < ApplicationRecord
  self.inheritance_column = nil
  has_many :groups
  has_many :sheets
  has_many :npcs
  has_many :managed_groups, class_name: 'Group', foreign_key: 'user_id'

  include PgSearch::Model

  pg_search_scope :search_by_name,
    against: [:name],
    using: {
      tsearch: { prefix: true }
    }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Add account_type as an attribute.
  enum account_type: { joueur: 'Joueur', MJ: 'MJ' }

  validates :account_type, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, on: :create
end
