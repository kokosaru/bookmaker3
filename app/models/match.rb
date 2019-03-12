class Match < ApplicationRecord
	has_many :teams, inverse_of: :match
	accepts_nested_attributes_for :teams, reject_if: :all_blank, allow_destroy: true

	enum genre:{野球: 0,サッカー:1,テニス:2,バスケットボール:3,バレーボール:4,卓球:5,バトミントン:6,esport:7,その他:8}
end
