class User < ActiveRecord::Base
  has_many :surveys
  has_many :answers
end
