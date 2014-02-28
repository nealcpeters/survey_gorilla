class Option < ActiveRecord::Base
  validates :text, presence: :true
  has_one :question
end
