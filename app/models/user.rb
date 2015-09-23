class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= "user"
  end

  def admin?
  	self.role=='admin'
  end
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
