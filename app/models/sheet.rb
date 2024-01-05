class Sheet < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :pdf, service: :amazon
  has_many :disciplines, dependent: :destroy
  has_many :backgrounds, dependent: :destroy
  has_one :path, dependent: :destroy
  has_many :voie_thaumaturgiques, dependent: :destroy
  has_many :advantages, dependent: :destroy
  has_many :disadvantages, dependent: :destroy

  accepts_nested_attributes_for :backgrounds
  accepts_nested_attributes_for :disciplines
  accepts_nested_attributes_for :voie_thaumaturgiques
  accepts_nested_attributes_for :advantages
  accepts_nested_attributes_for :disadvantages
  accepts_nested_attributes_for :path

end
