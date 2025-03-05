class Category < ApplicationRecord
    validates :nomCategory, presence: true
    has_many :traitements, dependent: :destroy
end
