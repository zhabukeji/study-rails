class Article < ApplicationRecord
    validates :title, :author, :context, presence: true
    # validates :status, inclusion: { in: %w{0 , 1}}
    enum :status, [:non_check, :active], default: :non_check
    self.per_page = 10

    def self.index_list
        Article.select(:id, :title, :author, :thumbnail, :context, :created_at, :status).order(created_at: :desc).take(3)
    end

    def self.admin_list(page = 1)
        Article.select(:id, :title, :author, :updated_at, :context, :created_at, :status).order(updated_at: :desc).page(page)
    end
end
