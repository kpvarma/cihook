class User < ActiveRecord::Base
  attr_accessible :email, :name, :service, :username
end
