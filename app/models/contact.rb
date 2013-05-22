class Contact < ActiveRecord::Base
  attr_accessible :bio, :birth_date, :entity_id, :first_name, :job_title, :last_name, :mobile, :social_handlers, :user_id, :website

  validates :first_name, :last_name, presence: true
end
