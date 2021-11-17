class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.text :content

      t.boolean :published, default: false
      t.datetime :created_time

      t.timestamps
    end
  end
end

# id (FK)
# author string
# title string
# content text
# created_time datetime
