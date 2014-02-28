class Answer < ActiveRecord::Base
    has_one :option
    has_one :user
    has_one :question, through: :options
    has_one :survey, through: :questions, through: :options
end
