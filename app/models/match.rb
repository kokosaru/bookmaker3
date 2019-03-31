class Match < ApplicationRecord
	has_many :teams, inverse_of: :match, dependent: :destroy
	accepts_nested_attributes_for :teams, reject_if: :all_blank, allow_destroy: true

	enum genre: {野球:0,サッカー:1,テニス:2,バスケットボール:3,バレーボール:4,卓球:5,バトミントン:6,eSport:7,その他:8}
	enum match_status: {試合前:0, 試合中:1, 試合終了:2}
end
