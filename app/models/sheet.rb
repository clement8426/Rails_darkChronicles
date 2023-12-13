class Sheet < ApplicationRecord
  belongs_to :user
  has_one_attached :pdf, service: :amazon
end
