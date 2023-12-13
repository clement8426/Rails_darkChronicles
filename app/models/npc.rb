class Npc < ApplicationRecord
  belongs_to :user
  include PgSearch::Model

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  pg_search_scope :global_search,
    against: [:name, :clan, :secte, :generation, :address, :description],
    using: {
      tsearch: { prefix: true }
    }

end
