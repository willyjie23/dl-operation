class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :context
      t.boolean :is_private
      t.integer :blog_id

      t.timestamps
    end
  end
end
