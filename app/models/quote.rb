class Quote < ApplicationRecord
    def self.index_list
        self.select(:id, :content).take(3)
    end
end
