class CreatePatientTraitements < ActiveRecord::Migration[8.0]
  def change
    create_table :patient_traitements do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :traitement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
