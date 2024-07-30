class Topbar < ApplicationRecord
    def self.index_list
        Topbar.select(:id, :name, :address, :created_at)
    end
end
