class WordsController < ApplicationController
  def index
    if params[:search] && params[:search] != ''
      @words = Word.where('lower(name) LIKE ?', "%#{params[:search].downcase}%").order(created_at: :desc)
    else
      @words = Word.all.limit(12).order(created_at: :desc)
    end
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
    @word = Word.friendly.find(params[:id])
  end

  def edit
    @word = Word.friendly.find(params[:id])
  end

  def update
    @word = Word.friendly.find(params[:id])
    if @word.update(word_params)
      redirect_to words_path
    else
      flash[:errors] = @word.errors.full_messages
      redirect_to word_edit_path
    end
  end

  def destroy
    @word = Word.friendly.find(params[:id])
    @word.destroy
    redirect_to words_path
  end

  private
  
  def word_params
    params.require(:word).permit(:name, :meaning, :example, :search)
  end
end