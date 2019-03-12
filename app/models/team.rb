class Team < ApplicationRecord
	belongs_to :match
  	has_many :counts, inverse_of: :team
  	accepts_nested_attributes_for :counts, reject_if: :all_blank, allow_destroy: true
end
