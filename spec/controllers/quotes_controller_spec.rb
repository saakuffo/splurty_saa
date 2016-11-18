require 'rails_helper'

RSpec.describe QuotesController do
  describe 'quotes#index actions' do
    it 'should display the normal index is quotes are in the DB' do
      quote = FactoryGirl.create(:quote)
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'should display the first_quote page if the DB is empty' do
      quote = FactoryGirl.create(:quote)
      quote.delete
      get :index
      expect(response).to redirect_to first_quote_path
    end
  end

  describe 'quotes#create actions' do
    it 'should load up flash with and error if the quote attributes are invalid' do
      post :create, quote: { saying: 'a', author: 'a' }
      expect(flash[:error]).to eq '<strong>Could not save</strong> the data you entered is invalid'
    end

    it 'should create a quote and redirect to the home page if the quote is valid' do
      post :create, quote: { saying: 'a' * 3, author: 'a' * 3 }
      expect(response).to redirect_to root_path
    end
  end

  describe 'quotes#about action' do
    it 'should load the about page' do
      get :about
      expect(response).to have_http_status(:success)
    end
  end
end
