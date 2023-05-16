class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :patient, null: true, foreign_key: {to_table: :users}
    add_reference :appointments, :doctor, null: true, foreign_key: {to_table: :users}

    add_reference :users, :category, foreign_key: true
  end
end
