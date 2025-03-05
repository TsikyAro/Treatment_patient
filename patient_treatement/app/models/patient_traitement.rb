class PatientTraitement < ApplicationRecord
  belongs_to :patient
  belongs_to :traitement
end
