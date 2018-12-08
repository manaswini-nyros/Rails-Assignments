class Author < ApplicationRecord
  has_many :articles
  has_one :account
end
