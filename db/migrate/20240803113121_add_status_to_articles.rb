class AddStatusToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :status, :integer , comment: "文章状态" , default: 0, null: false
  end
end
