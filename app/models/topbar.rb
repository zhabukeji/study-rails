class Topbar < ApplicationRecord
    def self.index_list
        self.select(:id, :name, :address, :created_at)
    end
end
