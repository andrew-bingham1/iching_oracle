require 'rails_helper'

RSpec.describe "ChatService", type: :request do
  describe "POST /chat_service", :vcr do
    it "returns a fortune" do
      chat_service = ChatService.new
      fortune = chat_service.get_fortune("9", "What is the meaning of life?")

      expect(fortune).to be_a(String)
    end
  end
end