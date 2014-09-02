class Provider < ActiveRecord::Base
  belongs_to :category

  has_secure_password

end
