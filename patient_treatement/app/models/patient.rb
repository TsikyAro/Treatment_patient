class Patient < ApplicationRecord
    validates :numerotelephone, presence: true, uniqueness: true
    validates :nomPatient, presence: true
  
    has_many :patient_traitements
    has_many :traitements, through: :patient_traitements
  end
  