class Memo < ApplicationRecord
    belongs_to :genre
    def short_description
        description[0, 15] + '...'
    end
end
