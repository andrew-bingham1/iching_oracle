require 'rails_helper'

RSpec.describe "ChatService", type: :request do
  describe "POST /chat_service" do
    it "returns a fortune" do
      chat_service = ChatService.new
      fortune = chat_service.get_fortune("9", "Shoud I buy a dog?")

      expect(fortune).to be_a(String)
    end
  end
end