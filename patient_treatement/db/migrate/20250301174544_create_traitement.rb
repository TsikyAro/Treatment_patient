class CreateTraitement < ActiveRecord::Migration[8.0]
  def change
    create_table :traitements do |t|
      t.references :category, null: false, foreign_key: true
      t.json :nomtraitement

      t.timestamps
    end
  end
end
