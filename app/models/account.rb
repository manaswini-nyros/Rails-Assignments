class Account < ApplicationRecord
	belongs_to :author
	validates :username,uniqueness: {case-sensitive : false}
end
