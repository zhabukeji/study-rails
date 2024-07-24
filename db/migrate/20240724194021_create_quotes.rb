class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.string :content, comment: '名言警句内容'
      t.timestamps
    end
  end
end
