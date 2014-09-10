class Provider < ActiveRecord::Base
  belongs_to :category

  has_secure_password

  validates_presence_of :email, :category_id, :name, :last_name_1, :last_name_2, :price, :phone, :dni

  validates_uniqueness_of :email, format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  belongs_to :category


  has_many :localizations
  has_many :locations, through: :localizations
  validates :locations, :presence => true


end
