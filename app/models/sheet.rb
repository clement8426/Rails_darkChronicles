class Sheet < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :pdf, service: :amazon
  has_many :disciplines, dependent: :destroy
  has_many :backgrounds, dependent: :destroy
  has_one :path, dependent: :destroy
  accepts_nested_attributes_for :path
  has_many :advantage_disadvantages, dependent: :destroy
  accepts_nested_attributes_for :advantage_disadvantages

end
