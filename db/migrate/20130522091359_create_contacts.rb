class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.text :bio
      t.string :job_title
      t.string :entity_id
      t.string :website
      t.string :mobile
      t.string :tags
      t.text :social_handlers

      t.timestamps
    end
  end
end
