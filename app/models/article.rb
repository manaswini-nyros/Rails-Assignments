class Article < ApplicationRecord
  has_and_belongs_to_many :tags
  belongs_to :author
  belongs_to :category
  validates :name, presence:true, length: { minimum:3 }
  validates :description, presence: true
  validates :is_published, acceptance: true
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