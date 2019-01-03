class RenamePasswordDigestToPasswordHash < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :password_digest, :password_hash
  end
end
