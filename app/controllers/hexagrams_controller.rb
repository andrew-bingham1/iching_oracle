class HexagramsController < ApplicationController

  def index
    @hexagrams = Hexagram.all
  end

  def show
    @hexagram = Hexagram.find(params[:id])
  end

  def random
    redirect_to hexagram_path(Hexagram.all.sample.id)
  end

end
