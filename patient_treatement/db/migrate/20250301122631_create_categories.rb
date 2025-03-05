class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string :nomCategory

      t.timestamps
    end
  end
end
