class Questions < ApplicationRecord
    has_many :Answers
    validates :text,:score ,presence: true
    validates_numericality_of :score, greater_than: 4, less_than_or_equal_to: 20, allow_blank: false
end
