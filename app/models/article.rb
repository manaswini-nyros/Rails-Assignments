class Article < ApplicationRecord
 after_destroy :log_destroy_action

 def log_destroy_action
 	puts 'Article destroyed'
 end

 belongs_to :author, required: false
belongs_to :categories, required: false

after_create :article_publishing

 

private

  def article_publishing


  puts "article published"
 

    self.status = "success"

    self.save!
  end

# validates :name, presence:true, length: { minimum:3 },:uniqueness => { :case_sensitive => false }
# validates :description, presence: true
# validates :is_published, acceptance: true
# attr_accessor :skip_name_validation
end 