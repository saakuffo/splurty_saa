# require 'spec/rails_helper'

FactoryGirl.define do
  factory :quote do
    sequence :saying do |n|
      "test saying #{n}"
    end
    sequence :author do |n|
      "test author #{n}"
    end
  end
end
