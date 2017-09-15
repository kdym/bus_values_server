class AddNomeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nome, :string
  end
end
