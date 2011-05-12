class User < ActiveRecord::Base
  acts_as_authentic
  
  validates_presence_of :email
  validates_presence_of :password
  
end
