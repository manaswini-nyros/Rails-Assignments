class RemoveArticleTagsFromTags < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :tags, :tag, foreign_key: true
  end
end
