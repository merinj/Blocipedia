class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis, dependent: :destroy
  before_save { self.email = email.downcase }
  before_save :set_default_role, :if => :new_record?    

  enum role: [:standard, :premium, :admin]

 def set_default_role
	self.role ||= :standard
 end   
end
