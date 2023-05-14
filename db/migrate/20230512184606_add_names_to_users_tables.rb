class AddNamesToUsersTables < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :doctors, :name, :string
    add_column :admins, :name, :string
  end
end
