class CharactersController < ApplicationController
  def new
    @character = Character.new
    render 'new'
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      flash[:success] = "Your new character has been created!"
      redirect_to @character
    else
      render :new
    end
  end

  def show
    @character = Character.find(params[:id])
    render
  end

  private

  def character_params
    params.require(:character).permit(:name)
  end
end
