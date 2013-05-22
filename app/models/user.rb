class User < ActiveRecord::Base
  belongs_to :contact

  devise :database_authenticatable, :registerable, :omniauthable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :bio, :birth_date, :entity_id, :first_name, :job_title, :last_name, 
                  :mobile, :social_handlers, :user_id, :website

  validates :first_name, :last_name, presence: true
end
