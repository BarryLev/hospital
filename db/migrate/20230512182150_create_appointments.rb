class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.text :recommendation, optional: true
      t.boolean :active, default: true, null: false

      t.timestamps
    end
  end
end
