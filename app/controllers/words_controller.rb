class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def new
    @new_word = Word.new
  end

  def create
    @new_word = Word.new(word_params)
    if @new_word.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  
  def word_params
    params.require(:word).permit(:name, :meaning, :example)
  end
end