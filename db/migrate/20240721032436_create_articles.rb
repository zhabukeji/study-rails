class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :thumbnail
      t.text :context

      t.timestamps
    end
  end
end
