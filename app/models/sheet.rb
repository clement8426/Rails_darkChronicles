class Sheet < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :pdf, service: :amazon
end
