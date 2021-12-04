require 'rails_helper'

RSpec.describe 'Articles', type: :feature do
  describe "View all articles" do
    before {visit articles_path}

    it "shows all artilce in the body" do
      within 'body' do
        expect(page).to have_content('Hello world')
        expect(page).to have_content('New Article')
      end
    end

      fill_in "field_name", with: "value"

    describe 'Create a new article' do
      before{visit new_article}
      it 'Succesfully create a new article' do 
    end
  end
end