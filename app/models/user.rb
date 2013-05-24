class User < ActiveRecord::Base
  has_many :users_entities
  has_many :entities, through: :users_entities

  devise :database_authenticatable, :registerable, :omniauthable, 
         :confirmable, :recoverable, :rememberable, :trackable, :validatable,
         :omniauth_providers => [:twitter]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :bio, :birth_date, :entity_id, :first_name, :job_title, :last_name, 
                  :mobile, :social_handlers, :user_id, :website, :entity_ids, :avatar

  validates :first_name, :last_name, presence: true

  mount_uploader :avatar, AvatarUploader

  def gravatar_url
    gravatar = Gravatar.new(self.email)
    if ENV['GRAVATAR_API_KEY'] && (gravatar = Gravatar.new(self.email, api: ENV['GRAVATAR_API_KEY'])).exists?
      return gravatar.image_url
    else
      nil
    end
  end
end
