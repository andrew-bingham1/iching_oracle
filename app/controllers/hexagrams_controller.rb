class HexagramsController < ApplicationController
  def show
    @hexagram = Hexagram.find(params[:id])
  end
end
