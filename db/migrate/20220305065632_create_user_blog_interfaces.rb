class CreateUserBlogInterfaces < ActiveRecord::Migration[6.1]
  def change
    create_table :user_blog_interfaces do |t|
      t.integer :user_id
      t.integer :blog_id

      t.timestamps
    end
  end
end
