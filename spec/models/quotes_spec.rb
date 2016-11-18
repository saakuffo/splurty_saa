require 'rails_helper'

RSpec.describe Quote do
  it 'should invalidate a quote that does not meet minimum requirements' do
    quote = Quote.new
    expect(quote).not_to be_valid
  end

  it 'should not allow a saying that is longer than 140 or shorter than 3 characters' do
    quote = Quote.new(saying: 'a' * 141, author: 'a' * 3)
    expect(quote).not_to be_valid

    quote = Quote.new(saying: 'a' * 2, author: 'a' * 3)
    expect(quote).not_to be_valid
  end

  it "should not allow an authors name that is longer than 140 or shorter than 3 characters'" do
    quote = Quote.new(saying: 'a' * 50, author: 'a' * 51)
    expect(quote).not_to be_valid

    quote = Quote.new(saying: 'a' * 50, author: 'a' * 2)
    expect(quote).not_to be_valid
  end

  it 'should create a new quote in the database is everything is valid' do
    quote = Quote.create(saying: 'a' * 140, author: 'a' * 50)
    expect(quote).to be_valid
    expect(quote).to eq Quote.all.last
  end
end
