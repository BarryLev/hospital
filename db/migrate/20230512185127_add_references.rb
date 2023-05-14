class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :user, null: true, foreign_key: true
    add_reference :appointments, :doctor, null: true, foreign_key: true

    add_reference :doctors, :category, null: false, foreign_key: true
  end
end
