require 'rails_helper'

RSpec.describe QuotesController do
  describe "quotes#index actions" do
    it "if there is a quote in the DB go to index" do
      quote = FactoryGirl.create(:quote)
      get :index
      expect(response).to have_http_status(:success)
    end

    it "if the database is empty it should go to first quote page" do
      quote = FactoryGirl.create(:quote)
      quote.delete
      get :index
      expect(response).to redirect_to first_quote_path
    end
  end

  describe "quotes#create actions" do
    it "if the quote is invalid display a flash message detailing a failure to create quote" do
      post :create, quote: {saying: 'a', author: 'a'}
      expect(flash[:error]).to eq '<strong>Could not save</strong> the data you entered is invalid'
    end

    it "if the quote is valid redirect to root path" do
      post :create, quote: {saying: 'a' * 3 , author: 'a' * 3 }
      expect(response).to redirect_to root_path
    end
  end
end