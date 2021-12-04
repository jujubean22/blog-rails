class Article < ApplicationRecord
    validates :author, :content, presence: true
    validates :title, presence: true, uniqueness: {scope: 'title', message:'should be unique'}

    has_many :comments
end
