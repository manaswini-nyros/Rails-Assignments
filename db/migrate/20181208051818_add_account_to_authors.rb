class AddAccountToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_reference :authors, :account, foreign_key: true
  end
end
