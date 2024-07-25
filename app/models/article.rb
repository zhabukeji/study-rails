class Article < ApplicationRecord
    validates :title, :author, :context, presence: true

    def self.index_list
        self.select(:id, :title, :author, :thumbnail, :context, :created_at).order(created_at: :desc).take(3)
    end
end
