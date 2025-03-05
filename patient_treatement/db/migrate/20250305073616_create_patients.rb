class CreatePatients < ActiveRecord::Migration[8.0]
  def change
    create_table :patients do |t|
      t.string :nomPatient
      t.string :numerotelephone

      t.timestamps
    end
    add_index :patients, :numerotelephone, unique: true
  end
end
