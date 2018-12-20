class AddStoryToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :story, :string
  end
end
