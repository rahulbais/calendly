class CreateGrievances < ActiveRecord::Migration[6.0]
  def change
    create_table :grievances do |t|
      t.belongs_to :office, null: false, foreign_key: true
      t.string :list_name

      t.timestamps
    end
  end
end
