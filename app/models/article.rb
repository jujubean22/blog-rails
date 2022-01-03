class Article < ApplicationRecord
    validates :author, :content, presence: true
    validates :title, presence: true, uniqueness: {scope: 'title', message:'should be unique'}

    has_many :comments
    has_and_belongs_to_many :tags

    before_validation :set_content

    def set_content
        unless self.content
        self.content = 'Default Content'
        end
    end

end
