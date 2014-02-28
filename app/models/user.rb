class User < ActiveRecord::Base
  validates :name, uniqueness: :true, presence: :true
  validates :email, uniqueness: :true, presence: :true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  has_many :surveys
  has_many :answers
end
