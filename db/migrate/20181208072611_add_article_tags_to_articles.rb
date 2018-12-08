class AddArticleTagsToArticles < ActiveRecord::Migration[5.2]
  def change
   add_reference: articles , :articles ,foreign_key:true
   add_reference: tags , :articles ,foreign_key:true
  end
end
