class Quote < ApplicationRecord
    def self.index_list
        Quote.select(:id, :content).take(3)
    end
end
