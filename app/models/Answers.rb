class Answers < ApplicationRecord
    # belongs_to :Questions
    validates :text,:is_true,:question_id,presence: true
end
