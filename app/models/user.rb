class User < ApplicationRecord
  self.inheritance_column = nil
  has_many :sheets
  has_many :npcs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
