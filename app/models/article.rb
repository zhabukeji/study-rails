class Article < ApplicationRecord
    validates :title, :author, :context, presence: true
    self.per_page = 5
    def self.index_list
        Article.select(:id, :title, :author, :thumbnail, :context, :created_at).order(created_at: :desc).take(3)
    end
    def self.admin_list(page = 1)
        Article.select(:id, :title, :author, :updated_at, :context, :created_at).order(updated_at: :desc).page(page)
    end
end
