class Article < ApplicationRecord
belongs_to :author, required: false
belongs_to :categories, required: false
validates :name, presence:true, length: { minimum:3 },:uniqueness => { :case_sensitive => false }
validates :description, presence: true
validates :is_published, acceptance: true
attr_accessor :skip_name_validation
end
