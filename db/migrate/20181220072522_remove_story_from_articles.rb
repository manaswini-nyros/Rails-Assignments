class RemoveStoryFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :story, :string
  end
end
