# frozen_string_literal: true

class HexagramsController < ApplicationController
  def index
    @hexagrams = Hexagram.all
  end

  def show
    @hexagram = Hexagram.find(params[:id])
    @response = session.delete(:response)
  end

  def random
    hex = Hexagram.all.sample.id
    question = params[:question]
    chat_service = ChatService.new
    response = chat_service.get_fortune(hex, question)
    session[:response] = response
    redirect_to hexagram_path(hex)
  end
end
