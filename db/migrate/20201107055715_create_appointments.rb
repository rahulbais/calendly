class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :office, null: false, foreign_key: true
      t.belongs_to :citizen, null: false, foreign_key: true
      t.string :subject
      t.string :venue

      t.timestamps
    end
  end
end
