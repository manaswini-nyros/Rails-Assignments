class Article < ApplicationRecord
  has_many :article_tags
  has_many :tags, through: :article_tags
  attr_accessor :new_tag_name
  belongs_to :author, required: false
  belongs_to :categories, required: false
  validates :name, presence:true, length: { minimum:3 },:uniqueness => { :case_sensitive => false }
  validates :description, presence: true
  validates :is_published, acceptance: true
  attr_accessor :skip_name_validation
  after_create :article_publishing
  after_destroy :log_destroy_action
  def log_destroy_action
    puts 'Article destroyed'
  end
  private
  def article_publishing
    puts "article published"
    self.status = "success"
    self.save!
  end
end 