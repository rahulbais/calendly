class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.string :subject
      t.datetime :start_time
      t.datetime :end_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
