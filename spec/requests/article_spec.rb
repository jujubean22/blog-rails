require 'rails_helper'

RSpec.describe 'ArticleCOntroller', type: :request do
  describe "GET /articles" do
    it "returns the index page" do
      get articles_path
      expect(response).to have_http_status(200)
    end
  end
end
