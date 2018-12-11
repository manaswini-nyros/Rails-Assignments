class RemoveArticleTagsFromArticles < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :articles, :article, foreign_key: true
  end
end
