class Article < ApplicationRecord
  mount_uploader :image,ImageUploader
  has_and_belongs_to_many :tags
  belongs_to :author, optional: true
  belongs_to :category, optional: true
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
  def self.published
    scope :created_before, ->(time) { where("created_at < ?", time)}
   end
end 