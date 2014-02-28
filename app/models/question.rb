class Question < ActiveRecord::Base
  has_one :survey
  has_many :options
  has_many :answers, through: :options
end
