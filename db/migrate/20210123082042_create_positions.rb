class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.string :title
      t.text :description
      t.integer :salary
      t.string :duration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
