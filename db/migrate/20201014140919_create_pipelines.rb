class CreatePipelines < ActiveRecord::Migration[6.0]
  def change
    create_table :pipelines do |t|
      t.belongs_to :grievance, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
