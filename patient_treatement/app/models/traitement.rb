class Traitement < ApplicationRecord
    belongs_to :category
    has_many :patient_traitements
    has_many :patients, through: :patient_traitements
end
