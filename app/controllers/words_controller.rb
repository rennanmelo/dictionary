class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to @word
    else
      flash[:errors] = @word.errors.full_messages
      redirect_to words_new_path
    end
  end

  def show
    @word = Word.find(params[:id])
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update(word_params)
      redirect_to words_path
    else
      flash[:errors] = @word.errors.full_messages
      redirect_to word_edit_path
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to words_path
  end

  private
  
  def word_params
    params.require(:word).permit(:name, :meaning, :example)
  end
end