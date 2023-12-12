class Npc < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:name, :clan, :secte, :generation, :address, :description]

  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  pg_search_scope :global_search,
    against: [:name, :clan, :secte, :generation, :address, :description],
    using: {
      tsearch: { prefix: true }
    }
end
