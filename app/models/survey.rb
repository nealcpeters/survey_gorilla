class Survey < ActiveRecord::Base
  validates :title, presence: :true, uniqueness: :true
  validates :description, presence: :true, uniqueness: :true

  belongs_to :user
  has_many :questions
  has_many :answers, through: :questions
end
