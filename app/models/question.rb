class Question < ActiveRecord::Base
  validates :text, presence: :true

  has_one :survey
  has_many :options
  has_many :answers
end
