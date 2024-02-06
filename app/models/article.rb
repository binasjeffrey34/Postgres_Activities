class Article < ApplicationRecord
    validates :name, presence: true,
                    uniqueness: true
    validates :body, presence: true,
                    length: { minimum: 1 }
end
