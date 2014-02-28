class User < ActiveRecord::Base
  has_many :surveys
  has_many :answers

  has_secure_password
end
