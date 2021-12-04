require 'rails_helper'

RSpec.describe Article, type: :model do

    let!(:article) {Article.new}

    context 'validations' do
      it 'is  not a valid name' do 
        article.content = 'Test Body'
        article.title = nil

        expect(article).to_not be_valid
        expect(article.errors).to be_present
        expect(article.errors.to_hash.keys).to include(:title)
      end

      it 'should be unique' do
        Article.create(:title => 'Duplicate Name', :content => 'Body', :author => 'test')
        article.title = 'Duplicate Name'

        expect(article).to_not be_valid
        expect(article.errors).to be_present
        expect(article.errors.to_hash.keys).to include(:title)
      end
        
    end
end
